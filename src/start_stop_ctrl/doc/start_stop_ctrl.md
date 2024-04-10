# start_stop_ctrl : Controller block for Bambu accelerator

## Description

The purpose of this IP is to control the generated Bambu component. It provides also a execution time feature to permit retreiving the process time through a latched value.

The controller takes 3 control signals in input :

- start : start the Bambu accelerator
- reset : constitutes a secondary reset connected to the Bambu accelerator to reset the bloc without resetting the entire FPGA system
- auto-restart : when activated, when the Bambu accelerator has finished, another start signal is sent imediately to re-launch the process

The controller provides 4 outputs status signals :

- status_running : the Bambu accelerator is running
- status_end_process : the Bambu accelerator has finished
- duration_count : when running, the time ellapsed since the beginning
- duration_count_latched : when finished, the total process time of the Bambu accelerator

Finally, there are 3 signals connected to the Bambu component to control it :

- ip_start to start the IP
- ip_reset to reset te IP
- ip_stop to detect when the IP has finished