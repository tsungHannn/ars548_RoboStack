from setuptools import find_packages
from setuptools import setup

setup(
    name='ars548_messages',
    version='1.0.1',
    packages=find_packages(
        include=('ars548_messages', 'ars548_messages.*')),
)
