#!/bin/bash
mkdir plot_sys_source
python plot.py init_location
python plot.py point_location_reinit_loc
python plot.py gps_init
python plot.py intergration
python plot.py current_odom_sa
python plot.py lidar_filter
python plot.py convert
python plot.py robot_localization_imu_encoder
python plot.py gps_odom
python plot.py localization_filter
python plot.py proto_reader
python plot.py lidar_component
python plot.py lidar_preprocess
python plot.py distance_indicator_ros
python plot.py udrive_control
python plot.py opendrive_behaviour_planner_node
python plot.py opendrive_global_planner_node
python plot.py motion_planning_infa
python plot.py can_port
python plot.py guardian
python plot.py lower_control
python plot.py voice_broadcast_new
python plot.py event_data_recorder_node
python plot.py gui_tools_set_node
python plot.py unity-drive-remote-driving
python plot.py rosbridge_server
python plot.py rviz
python plot.py rion_rtu_node
python plot.py cmcc_sdk
python plot.py encoder_to_odom
python plot.py udi_client
python plot.py uobs
python plot.py unity-drive-remote-driving
python plot_io.py io-occupy
python plot1.py idle_cpu
python plot1.py occupy_mem
python plot1.py cpu_temperature
python plot1.py cpu-overclock
python plot_data_merge.py gps_driver 3
python plot_data_merge.py hesailidar_pointcloud 5
python plot_data_merge.py voice_broadcast_new 2

