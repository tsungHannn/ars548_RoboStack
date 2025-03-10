import subprocess
from argparse import ArgumentParser
from time import sleep

pre_commands = ['conda activate ros && source ~/catkin_ws/devel/setup.bash']
pre_command = ' && '.join(pre_commands)
commands = [
    ('rviz', 'rviz -d ./main.rviz'),
    ('image_transport', 'rosrun image_transport republish raw in:=/aravis_cam/image_color compressed out:=/aravis_cam/image_color'),            
    ('stream_camera', 'python stream_camera.py'),
    ('stream_radar', 'rosrun ars548_driver ars548_driver'),
    ('bag', ''),
    ('main', 'python main.py'),
    ('projector', 'python projector.py')
    # ('get_RGB_pic', 'python getRGB.py')
]


def start_tmux_session(args):

    # Start a new tmux session
    subprocess.run(['tmux', 'new-session', '-d', '-s', 'ros'])

    # Start roscore in the first pane
    subprocess.run(['tmux', 'send-keys', '-t', 'ros:0', f'{pre_command} && roscore', 'C-m'])
    sleep(.5)
    for i, (name, cmd) in enumerate(commands, start=1):
        print(name, cmd, i)
        subprocess.run(['tmux', 'new-window', '-t', 'ros:', '-n', name])
        subprocess.run(['tmux', 'send-keys', '-t', f'ros:{i}', f'{pre_command}', 'C-m'])
        if name != 'bag':
            subprocess.run(['tmux', 'send-keys', '-t', f'ros:{i}', f'{cmd}', 'C-m'])
        else:
            cmd = 'rosbag record --duration 1m /aravis_cam/image_color/compressed -e "/radar/point_cloud(.*)" -o ~/bags/1.bag'
            subprocess.run(['tmux', 'send-keys', '-t', f'ros:{i}', f'{cmd}'])

    # Attach to the tmux session
    subprocess.run(['tmux', 'attach-session', '-t', 'ros'])

if __name__ == "__main__":
    parser = ArgumentParser()
    args = parser.parse_args()
    start_tmux_session(args)
