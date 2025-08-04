import subprocess
from argparse import ArgumentParser
from time import sleep

pre_commands = [
    'micromamba activate ros2 && source ~/workspace/ncsist/ars548_RoboStack/install/setup.bash'
]
pre_command = ' && '.join(pre_commands)

commands = [
    ('rviz2', 'rviz2 -d ./ros2_main.rviz'),
    ('image_transport', 'ros2 run image_transport republish compressed raw --ros-args --remap in/compressed:=/aravis_cam/image_color/compressed --remap out:=/aravis_cam/image_color'),
    ('main', 'python3 main_ros2.py'),
]

stream = [
    ('stream_camera', 'python3 stream_camera.py'),
    ('stream_radar', 'ros2 run ars548_driver ars548_driver')
]

control = ('control', 'python3 projector.py')

bag = ('ros2 bag play /media/mvclab/HDD/ncsist/2025/data/20250226/A_place/ros2_bag/ --loop --clock')

def start_tmux_session(args):
    session_name = 'ros2'
    
    if args.bag:
        commands.append(bag)

    if args.control:
        commands.append(control)

    if args.stream:
        commands.extend(stream)

    # Start a new tmux session
    subprocess.run(['tmux', 'new-session', '-d', '-s', session_name])

    # Start ros2 daemon (optional but useful)
    subprocess.run(['tmux', 'send-keys', '-t', f'{session_name}:0', f'{pre_command} && ros2 daemon start', 'C-m'])
    sleep(0.5)

    for i, (name, cmd) in enumerate(commands, start=1):
        print(name, cmd, i)
        subprocess.run(['tmux', 'new-window', '-t', session_name, '-n', name])
        subprocess.run(['tmux', 'send-keys', '-t', f'{session_name}:{i}', f'{pre_command}', 'C-m'])
        subprocess.run(['tmux', 'send-keys', '-t', f'{session_name}:{i}', f'{cmd}', 'C-m'])

    # Record ros2 bag
    subprocess.run(['tmux', 'new-window', '-t', session_name, '-n', 'bag_record'])
    subprocess.run(['tmux', 'send-keys', '-t', f'{session_name}:{len(commands)+1}', f'{pre_command}', 'C-m'])
    record_cmd = (
        'ros2 bag record '
        '--duration 30 '
        '/aravis_cam/image_color/compressed '
        '-e "/radar/.*" '
        '-o ~/bags/1'
    )
    subprocess.run(['tmux', 'send-keys', '-t', f'{session_name}:{len(commands)+1}', f'{record_cmd}', 'C-m'])

    # Attach to session
    subprocess.run(['tmux', 'attach-session', '-t', session_name])


if __name__ == "__main__":
    parser = ArgumentParser()
    parser.add_argument('--bag', action='store_true')
    parser.add_argument('--control', action='store_true')
    parser.add_argument('--stream', action='store_true')
    args = parser.parse_args()
    start_tmux_session(args)
