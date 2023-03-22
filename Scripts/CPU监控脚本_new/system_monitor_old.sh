#!/bin/bash
while :
do

    #arg=$(ifconfig -a|grep inet|grep -v 127.0.0.1|grep -v inet6|awk '{print $2}'|tr -d "addr:"|cut -f 3 -d ".")
    #arg=$(who | grep clark | cut -f 1 -d " ")
    arg=udi
    if [ ! -d /home/$arg/.ros/log/sys_monitor_log ];then
      mkdir /home/$arg/.ros/log/sys_monitor_log
    fi

    DEL_NAME_FOLDER="sys_monitor_log"$(date -d "7 days ago" "+%Y%m%d")
    if [ -d /home/$arg/.ros/log/sys_monitor_log/$DEL_NAME_FOLDER  ];then
        rm -rf /home/$arg/.ros/log/sys_monitor_log/$DEL_NAME_FOLDER
    fi  

    NAME_FILE="sys_monitor_log"$(date "+%Y%m%d%H").txt
    NAME_FOLDER="sys_monitor_log"$(date "+%Y%m%d")
    if [ ! -d /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER  ];then
      mkdir /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER
    fi




    top -b -n 1 | sed -n 7,27p | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/$NAME_FILE
    top -b -n 1 | grep COMMAND | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    #
    #
    top -b -n 1 | grep can_port | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep cmcc_sdk | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep roscore | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    top -b -n 1 | grep encoder_to | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep lower_con | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    top -b -n 1 | grep gps_odom_ | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep guardian | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep gui_tools | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    top -b -n 1 | grep lidar_prep | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    top -b -n 1 | grep localizati* | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.tx
    top -b -n 1 | grep motion_pla | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep opendrive | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    top -b -n 1 | grep voice_ | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep sensor_p | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    top -b -n 1 | grep sys_data | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep udrive_ | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep udi_client | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    top -b -n 1 | grep lidar_trac | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep rion_ | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep ekf_loca | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep quectel- | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    top -b -n 1 | grep unity-drive-remote-driving | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep uobs | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep distance_i | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    top -b -n 1 | grep rosbridge_ser | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt

    cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt | column -t >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/$NAME_FILE
    rm /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    nvidia-smi | tail -n +12 >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/$NAME_FILE


    top -b -n 1 | grep can_port | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/can_port.txt
    top -b -n 1 | grep cmcc_sdk | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/cmcc_sdk.txt
    top -b -n 1 | grep roscore | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/roscore.txt

    top -b -n 1 | grep encoder_to | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/encoder_to_odom.txt
    top -b -n 1 | grep lower_con | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/lower_control.txt

    top -b -n 1 | grep gps_odom_ | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gps_odom.txt
    top -b -n 1 | grep guardian | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/guardian.txt

    top -b -n 1 | grep lidar_prep | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/lidar_preprocess.txt

    top -b -n 1 -w 500 | grep localization_fi | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/localization_filter.txt  
    top -b -n 1 | grep motion_pla | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/motion_planning_infa.txt
 
    top -b -n 1 | grep voice_ | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/voice_broadcast_new.txt
    top -b -n 1 | grep sensor_p | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/sensor_protector.txt

    top -b -n 1 | grep sys_data | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/sys_data_hub.txt
    top -b -n 1 | grep udrive_ | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/udrive_control.txt
    top -b -n 1 | grep udi_client | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/udi_client.txt

    top -b -n 1 | grep lidar_trac | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/lidar_component.txt
    top -b -n 1 | grep rion_ | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/rion_rtu_node.txt
    top -b -n 1 | grep ekf_loca | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/robot_localization_imu_encoder.txt
    top -b -n 1 | grep quectel | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/5gnet.txt

    top -b -n 1 -w 500 | grep -w "localization" | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/point_location_reinit_loc.txt #supervazier两个程序，top上只有一个，localization
    top -b -n 1 | grep hesai_li | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/hesailidar_pointcloud.txt        #有五个数据python里要加起来
    top -b -n 1 | grep gps_ntrip | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gps_driver.txt                  #三个数据python里要加起来
    top -b -n 1 | grep gps_hand | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gps_driver.txt 

    lscpu       | grep MHz  | sed -n 1p | awk '{print $3}'|  ts '%H:%M:%S'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/cpu-overclock.txt
    top -b -n 1 | grep %Cpu | awk '{print $8}' | ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/idle_cpu.txt
    top -b -n 1 | grep KiB  | sed -n 1p | awk '{print (($8/$4)*100)}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/occupy_mem.txt
    #free | sed -n 2p | awk '{print $4}' | ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/occupy_mem.txt
    #top -b -n 1 | grep unity-drive-remote-driving | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/unity-drive-rem.txt #有四个数据python里要加起来
    top -b -n 1 | grep uobs | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/uobs.txt
    top -b -n 1 | grep distance_i | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/distance_indicator_ros.txt
    top -b -n 1 | grep rosbridge_ser | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/rosbridge_server.txt
    sensors     | grep Package |awk '{print $4}'|ts '%H:%M:%S'>> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/cpu_temperature.txt

    top -b -n 1 | grep init_loca | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/init_location.txt
    top -b -n 1 | grep gps_init | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gps_init.txt

    top -b -n 1 | grep convert | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/convert.txt
    top -b -n 1 | grep proto_re | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/proto_reader.txt
    top -b -n 1 | grep event_data | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/event_data_recorder_node.txt
    top -b -n 1 | grep rviz | awk '{print $9,$10}'| ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/rviz.txt

    top -c -bn1 -p $(pgrep -f "intergration" |tr "\\n" "," |sed 's/,$//') |sed -n 8p |awk '{print $9,$10}'|ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/intergration.txt
    top -c -bn1 -p $(pgrep -f "gui_tools_set_n" |tr "\\n" "," |sed 's/,$//') |sed -n 8p |awk '{print $9,$10}'|ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gui_tools_set_node.txt
    top -c -bn1 -p $(pgrep -f "current_odom_sa" |tr "\\n" "," |sed 's/,$//') |sed -n 8p |awk '{print $9,$10}'|ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/current_odom_sa.txt
    top -c -bn1 -p $(pgrep -f "lidar_filter" |tr "\\n" "," |sed 's/,$//') |sed -n 8p |awk '{print $9,$10}'|ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/lidar_filter.txt
    top -c -bn1 -p $(pgrep -f "/lib/opendrive_b" |tr "\\n" "," |sed 's/,$//') |sed -n 8p |awk '{print $9,$10}'|ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/opendrive_behaviour_planner_node.txt
    top -c -bn1 -p $(pgrep -f "/lib/opendrive_g" |tr "\\n" "," |sed 's/,$//') |sed -n 8p |awk '{print $9,$10}'|ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/opendrive_global_planner_node.txt
    top -c -bn1 -p $(pgrep -f "remote-dri" |tr "\\n" "," |sed 's/,$//') |sed -n 8,18p |awk '{print $9,$10}'|ts '%H:%M:%S' >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/unity-drive-remote-driving.txt #十个数据python里要加起来

    sleep 1  #modified by lex 10 to 1
done
