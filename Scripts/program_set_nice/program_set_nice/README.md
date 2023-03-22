1. 增加可执行权限
sudo chmod +x program_cpu_priority.sh program_set_nice.sh

2. 修改 program_cpu_priority.sh 文件
增加以下内容，优先级是-20到19，越小代表优先级越高
sudo ./program_set_nice.sh <program_name> <program_priority>
eg: sudo ./program_set_nice.sh guardian -1

3. 执行脚本，执行脚本前，先开启需要修改优先级的程序
sudo bash program_cpu_priority.sh
