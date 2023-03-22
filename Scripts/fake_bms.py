# ！/usr/bin/python
# -*- coding: utf-8 -*-

import time
import rospy
from sei_msgs.msg import BmsFeedback
from sei_msgs.msg import MotorFeedback
from std_msgs.msg import UInt8MultiArray


class FakeBms(object):
    def __init__(self):
        # Simulation Parameters
        self.time_rate_ = 60.  # for simulation
        self.standard_battery_life_ = 10. * 60 * 60  # 10 hours in seconds
        self.standard_charging_time_ = 3. * 60 * 60  # 1 hour in seconds
        self.battery_start_time_ = time.time()
        self.initial_soc_ = 100.
        self.initial_charging_status_ = False
        self.charging_start_time_ = 0

        # BmsFeedback message
        self.bms_feedback_ = BmsFeedback()
        self.bms_feedback_.header.frame_id = "fake_bms_feedback"
        self.bms_feedback_.charging_status = self.initial_charging_status_
        self.bms_feedback_.battery_percentage = self.initial_soc_

        # ROS publisher
        self.bms_feedback_pub_ = rospy.Publisher(
            "/can_port/bms_feedback", BmsFeedback, queue_size=1)

        print("FakeBms: Initialized")

    def Update(self):
        self.bms_feedback_.header.stamp = rospy.Time.now()
        delta_soc = (time.time() - self.battery_start_time_) / \
            self.standard_battery_life_ * 100 * self.time_rate_
        final_soc = self.bms_feedback_.battery_percentage - delta_soc
        self.bms_feedback_.battery_percentage = max(final_soc, 0.)
        self.bms_feedback_pub_.publish(self.bms_feedback_)
        self.battery_start_time_ = time.time()

    def GetFeedback(self):
        return self.bms_feedback_

    def GetSoc(self):
        return self.bms_feedback_.battery_percentage

    def GetTimeRate(self):
        return self.time_rate_

    def SetTimeRate(self, time_rate):
        self.time_rate_ = time_rate

    def SetSoc(self, soc):
        self.bms_feedback_.battery_percentage = soc
        self.battery_start_time_ = time.time()

    def EnableCharging(self):
        self.bms_feedback_.charging_status = True
        self.charging_start_time_ = time.time()

    def DisableCharging(self):
        self.bms_feedback_.charging_status = False
        if (self.charging_start_time_ != 0):
            charging_duration = time.time() - self.charging_start_time_
            delta_soc = charging_duration / self.standard_charging_time_ * 100 * self.time_rate_
            final_soc = self.bms_feedback_.battery_percentage + delta_soc
            soc = min(final_soc, 100.)
            self.SetSoc(soc)
        self.charging_start_time_ = 0

if __name__=="__main__":
   fk=FakeBms()
   fk.GetTimeRate()