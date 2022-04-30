#!/bin/bash
### BEGIN INIT INFO
# Provides:          icar_bringup
# Required-Start:    $network $local_fs $remote_fs
# Required-Stop:     $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: icar_bringup 
# Description:       icar_bringup 
### END INIT INFO
source /opt/ros/kinetic/setup.bash
source /home/corvin/icar_ws/devel/setup.bash
roslaunch icar_bringup run_icar_with_joystick.launch > /home/corvin/icar_ws/autostart.log 2>&1
exit 0