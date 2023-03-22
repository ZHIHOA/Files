#!/usr/bin/python2.7
# -*- coding: utf-8 -*
import time
import threading
import copy
from udrive_msgs.msg import ChassisSonar
import rospy
import roslib
import sys
from sensor_msgs.msg import JointState as SonarObstacle
from std_msgs.msg import String

from pathlib import Path
import pandas as pd
import datetime
import csv


class SonarTest():
    def __init__(self):
        self.start_or_stop_ = 0
        self.stop_record_ = 1
        self.obstacle_updated_ = True
        self.obstacle_name_ = ''
        self.obstacle_others_ = ''
        self.obstacle_x_ = 0
        self.obstacle_y_ = 0
        self.obstacle_z_ = 0
        self.front_sonar_ = [0, 0, 0, 0]
        self.rear_sonar_ = [0, 0, 0, 0]
        self.left_sonar_ = [0, 0, 0, 0]
        self.right_sonar_ = [0, 0, 0, 0]
        self.duration_ = 0


        # 初始化 (use time)
        self.file_name_ = ""
        self.CreateFile()
        self.data_ = []

        rospy.Subscriber('/chassis/sonar', ChassisSonar, self.ChassisSonarSub)
        # 障碍物信息订阅
        rospy.Subscriber('/sonar/obstacle', SonarObstacle,
                         self.SonarObstacleSub)

        self.lock_ = threading.RLock()
        # 开启一个线程记录数据
        deal_with_data = threading.Thread(
            target=self.DealWithData, name='data_thread')
        deal_with_data.setDaemon(True)
        deal_with_data.start()

    def ChassisSonarSub(self, msg_sonar):
        self.front_sonar_ = copy.deepcopy(msg_sonar.front_sonar)
        self.rear_sonar_ = copy.deepcopy(msg_sonar.rear_sonar)
        self.left_sonar_ = copy.deepcopy(msg_sonar.left_sonar)
        self.right_sonar_ = copy.deepcopy(msg_sonar.right_sonar)

    def SonarObstacleSub(self, msg_obstacle):
        # 暂停或者开始记录数据
        self.start_or_stop_ = msg_obstacle.velocity[0]

        # 暂停时，不再更新障碍物数据
        if self.start_or_stop_ == 0:
            return

        if (self.obstacle_name_ != msg_obstacle.name[0] or
                self.obstacle_others_ != msg_obstacle.name[1] or
                self.obstacle_x_ != msg_obstacle.position[0] or
                self.obstacle_y_ != msg_obstacle.position[1] or
                self.obstacle_z_ != msg_obstacle.position[2] or
                self.duration_ != msg_obstacle.effort[0]):
            self.obstacle_name_ = msg_obstacle.name[0]
            self.obstacle_others_ = msg_obstacle.name[1]
            self.obstacle_x_ = msg_obstacle.position[0]
            self.obstacle_y_ = msg_obstacle.position[1]
            self.obstacle_z_ = msg_obstacle.position[2]

            self.duration_ = msg_obstacle.effort[0]
            self.start_time_ = time.time()
            self.stop_record_ = 0

            # 新的障碍物出现，更新障碍物
            self.UpdateObstacleInfo(True)

            return

    def UpdateObstacleInfo(self, true_or_false):
        # 加锁，避免读数据时同时在更新 obstacle_updated_ 变量时，数据滞后一帧
        self.lock_.acquire()
        self.obstacle_updated_ = true_or_false
        self.lock_.release()

    def DealWithData(self):
        rate = rospy.Rate(10)
        # print("Wait 3 seconds for the topic's outputs to stabilize.")
        # time.sleep(3)
        print("Start to deal with the data.")

        while not rospy.is_shutdown():
            # 暂停或者超过记录时长时，等待
            if (self.start_or_stop_ == 0 or
                    self.stop_record_ == 1):
                continue

            duration = time.time() - self.start_time_
            #  self.duration_的值为0时，意味着无限时长记录
            if (duration > self.duration_ and
                    self.duration_ != 0):
                print("Reached record time: ", self.duration_, ", stop.")
                self.stop_record_ = 1
                continue

            # 新的障碍物信息来了，进行对应的处理
            if self.obstacle_updated_ == True:
                print("Received new obstacle: ", self.obstacle_name_, self.obstacle_x_,
                      self.obstacle_y_, self.obstacle_z_, self.obstacle_others_)
                # 先把障碍物的变化更新为false
                self.UpdateObstacleInfo(False)

                # add old obs info to table
                if (len(self.data_) != 0):  # not first obs
                    with open(self.file_name_, "a") as f:
                        writer = csv.writer(f)
                        writer.writerow(self.data_)

                # 新的障碍物的数据到来，清空之前已经写入的数据并在下一行写入新的障碍物信息
                self.data_ = []
                self.data_.append(self.obstacle_name_)
                self.data_.append(self.obstacle_x_)
                self.data_.append(self.obstacle_y_)
                self.data_.append(self.obstacle_z_)
                self.data_.append(self.obstacle_others_)

                for i in range(4):
                    self.data_.append(self.front_sonar_[i])
                for i in range(4):
                    self.data_.append(self.rear_sonar_[i])
                for i in range(4):
                    self.data_.append(self.left_sonar_[i])
                for i in range(4):
                    self.data_.append(self.right_sonar_[i])

            # 障碍物没有改变，进行对应的处理
            elif (self.obstacle_updated_ == False):
                # 同一个障碍物的不同组数据
                for i in range(4):
                    self.data_.append(self.front_sonar_[i])
                for i in range(4):
                    self.data_.append(self.rear_sonar_[i])
                for i in range(4):
                    self.data_.append(self.left_sonar_[i])
                for i in range(4):
                    self.data_.append(self.right_sonar_[i])

            rate.sleep()

        # 输出文件
        with open(self.file_name_, "a") as f:
            writer = csv.writer(f)
            writer.writerow(self.data_)

        print("File is saved as: " + self.file_name_)

    def CreateFile(self):
        # 添加首行类别
        index = ["obs name", "x", "y", "z", "string",
                 "front_1", "front_2", "front_3", "front_4",
                 "rear_1", "rear_2", "rear_3", "rear_4",
                 "left_1", "left_2", "left_3", "left_4",
                 "right_1", "right_2", "right_3", "right_4"]

        # 用当前测试时间命名文件
        ct = datetime.datetime.now()

        self.file_name_ = "./" + str(ct) + ".csv"

        f = open(self.file_name_, "a")
        writer = csv.writer(f)
        writer.writerow(index)
        f.close()

        return


if __name__ == "__main__":
    rospy.init_node("sonar_test", anonymous=True)
    sonar_test = SonarTest()
    rospy.spin()
