import subprocess
from argparse import ArgumentParser
from time import sleep

pre_commands = ['micromamba activate ros && source ~/ars548_RoboStack/devel/setup.bash']
pre_command = ' && '.join(pre_commands)
commands = [
    ('rviz', 'rviz -d ./main.rviz'),
    ('image_transport1', 'rosrun image_transport republish compressed in:=/aravis_cam1/image_color raw out:=/aravis_cam1/image_color'),
    ('image_transport2', 'rosrun image_transport republish compressed in:=/aravis_cam2/image_color raw out:=/cam2_decompressed'),
    ('main', 'python main.py'),
    ('bev_ros', 'python BEV_test/bev_ros.py'),
]

stream = [('stream_camera', 'python stream_camera.py'), 
          ('stream_radar', 'rosrun ars548_driver ars548_driver')]
control = ('control', 'python projector_tkinter_ros1.py')
bag = ('rosbag', 'rosbag play /media/mvclab/HDD/ncsist/2025/data/20250226/B_place/1_2025-02-26-10-36-45.bag -l --clock -u 6')

def start_tmux_session(args):
    if args.bag:
        commands.append(bag)
    
    if args.control:
        commands.append(control)
    
    if args.stream:
        commands.extend(stream)

    # Start a new tmux session
    subprocess.run(['tmux', 'new-session', '-d', '-s', 'ros'])

    # Start roscore in the first pane
    subprocess.run(['tmux', 'send-keys', '-t', 'ros:0', f'{pre_command} && roscore', 'C-m'])
    sleep(.5)
    for i, (name, cmd) in enumerate(commands, start=1):
        print(name, cmd, i)
        subprocess.run(['tmux', 'new-window', '-t', 'ros:', '-n', name])
        subprocess.run(['tmux', 'send-keys', '-t', f'ros:{i}', f'{pre_command}', 'C-m'])
        subprocess.run(['tmux', 'send-keys', '-t', f'ros:{i}', f'{cmd}', 'C-m'])
    
    
    subprocess.run(['tmux', 'new-window', '-t', 'ros:', '-n', 'bag_record'])
    subprocess.run(['tmux', 'send-keys', '-t', f'ros:{len(commands)+1}', f'{pre_command}', 'C-m'])
    cmd = 'rosbag record --duration 30 /aravis_cam/image_color/compressed -e "/radar/(.*)" -o ~/bags/1.bag'
    subprocess.run(['tmux', 'send-keys', '-t', f'ros:{len(commands)+1}', f'{cmd}'])

    # Attach to the tmux session
    subprocess.run(['tmux', 'attach-session', '-t', 'ros'])

if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument('--bag', action='store_true')
    parser.add_argument('--control', action='store_true')
    parser.add_argument('--stream', action='store_true')
    args = parser.parse_args()
    start_tmux_session(args)
