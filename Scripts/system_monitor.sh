#!/bin/bash

cnt=0
arg=udi
function copy() {
# -----------------0
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep can_port|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/can_port.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep cmcc_sdk|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/cmcc_sdk.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep roscore |awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/roscore.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep encoder_to|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/encoder_to_odom.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep lower_co|awk '{print $1,$10,$11}'   >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/lower_control.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep gps_odom_|awk '{print $1,$10,$11}'  >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gps_odom.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep guardian|awk '{print $1,$10,$11}'   >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/guardian.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep lidar_prep|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/lidar_preprocess.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep localization_fi|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/localization_filter.txt
# -----------------9
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep motion_pla|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/motion_planning_infa.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep voice_|awk '{print $1,$10,$11}'     >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/voice_broadcast_new.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep sensor_p|awk '{print $1,$10,$11}'   >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/sensor_protector.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep sys_data|awk '{print $1,$10,$11}'   >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/sys_data_hub.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep udrive_|awk '{print $1,$10,$11}'    >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/udrive_control.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep udi_client|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/udi_client.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep lidar_trac|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/lidar_component.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep rion_|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/rion_rtu_node.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep ekf_loca|awk '{print $1,$10,$11}'   >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/robot_localization_imu_encoder.txt
# -----------------18
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep quectel|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/5gnet.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep -w localization|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/point_location_reinit_loc.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep hesai_li|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/hesailidar_pointcloud.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep gps_ntrip|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gps_driver.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep gps_hand|awk '{print $1,$10,$11}'  >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gps_driver.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep uobs|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/uobs.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep distance_i|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/distance_indicator_ros.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep rosbridge_ser|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/rosbridge_server.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep init_loca|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/init_location.txt
# -----------------27
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep gps_init|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gps_init.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep convert|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/convert.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep proto_re|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/proto_reader.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep event_data|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/event_data_recorder_node.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep rviz|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/rviz.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep vehicle_c|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/vehicle_control.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep intergration|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/intergration.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep gui_tools_set_n|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/gui_tools_set_node.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep current_odom_sa|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/current_odom_sa.txt
# -----------------36
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep lidar_filter|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/lidar_filter.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep opendrive_b|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/opendrive_behaviour_planner_node.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep opendrive_g|awk '{print $1,$10,$11}' >/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/opendrive_global_planner_node.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep remote-dri|awk '{print $1,$10,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/unity-drive-remote-driving.txt
# -----------------40
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep %Cpu  |awk '{print $1,$9}'  >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/idle_cpu.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep %Cpu  |awk '{print $1,$11}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/occupy_io.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep KiB   |awk '{print $1,(($9/$5)*100)}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/occupy_mem.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep MHz   |awk '{print $1,$4}'  >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/cpu-overclock.txt
cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt |grep Package   |awk '{print $1,$5}' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/cpu_temperature.txt
# -----------------45
}

while :
do
    #current=`date "+%H:%M:%S"`
    #echo $current
# /----------------- 
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
# -----------------/ config
cnt

# /----------------- 
    top -b -n 1 | sed -n 7,27p | awk '{print $12,$9,$10}'| column -t | awk '{ print strftime("%Y-%m-%d %H:%M:%S",systime())"\t" $0; fflush() }' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/$NAME_FILE
    #cat /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt | column -t >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/$NAME_FILE
    #rm /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/tmp.txt
    nvidia-smi | tail -n +12 >> /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/$NAME_FILE
# -----------------/ log

# /----------------- 
# hesai_lidar has 5 to add, gps_ntrip has 3 to add, remote-drive has 10 to add


    top -b -n 1 -w 500| grep -E "can_port|cmcc_sdk|roscore|encoder_to|lower_con|gps_odom_|guardian|lidar_prep|localization_fi|motion_pla|voice_|sensor_p|sys_data|udrive_|udi_client|lidar_trac|rion_|ekf_loca|quectel|localization|hesai_li|gps_ntrip|gps_hand|uobs|distance_i|rosbridge_ser|init_loca|gps_init|convert|proto_re|event_data|rviz|vehicle_c|%Cpu|KiBM|intergration|gui_tools_set_n|current_odom_sa|lidar_filter|opendrive_b|opendrive_g|remote-dri" | ts '%H:%M:%S' >>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt
# -----------------
    lscpu       | grep MHz  | sed -n 1p |ts '%H:%M:%S'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt
    sensors     | grep Package          |ts '%H:%M:%S'>>/home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt
# -----------------/ generate temp file
    echo $cnt
        if [ $cnt -eq 60 ]
        then
        cnt=0
        # copy and remove
        copy
        rm -rf /home/$arg/.ros/log/sys_monitor_log/$NAME_FOLDER/temp.txt
        fi
    let cnt+=1

    sleep 0.1  
done
