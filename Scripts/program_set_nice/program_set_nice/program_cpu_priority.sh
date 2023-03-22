#!/bin/bash

sudo -v

sudo ./program_set_nice.sh lower_control -10
sudo ./program_set_nice.sh guardian -10
sudo ./program_set_nice.sh can_port -10

