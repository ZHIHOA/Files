#!/bin/bash
mkdir plot_sys_source
python3 plot.py init_location
python3 plot.py point_location_reinit_loc
python3 plot.py gps_init
python3 plot.py intergration
python3 plot.py current_odom_sa
python3 plot.py lidar_filter
python3 plot.py convert
python3 plot.py robot_localization_imu_encoder
python3 plot.py gps_odom
python3 plot.py localization_filter
python3 plot.py proto_reader
python3 plot.py lidar_component
python3 plot.py lidar_preprocess
python3 plot.py distance_indicator_ros
python3 plot.py udrive_control
python3 plot.py opendrive_behaviour_planner_node
python3 plot.py opendrive_global_planner_node
python3 plot.py motion_planning_infa
python3 plot.py can_port
python3 plot.py guardian
python3 plot.py lower_control
python3 plot.py voice_broadcast_new
python3 plot.py event_data_recorder_node
python3 plot.py gui_tools_set_node
python3 plot.py unity-drive-remote-driving
python3 plot.py rosbridge_server
python3 plot.py rviz
python3 plot.py rion_rtu_node
python3 plot.py cmcc_sdk
python3 plot.py encoder_to_odom
python3 plot.py udi_client
python3 plot.py uobs
python3 plot.py unity-drive-remote-driving
python3 plot1.py idle_cpu
python3 plot1.py occupy_mem
python3 plot1.py cpu_temperature
python3 plot1.py cpu-overclock
python3 plot_data_merge.py gps_driver 3
python3 plot_data_merge.py hesailidar_pointcloud 5
python3 plot_data_merge.py voice_broadcast_new 2

