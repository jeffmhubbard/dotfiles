#!/usr/bin/env python3

from distutils.dir_util import copy_tree
from os import path

if input("Install? (yes/no): ").lower().strip() == "yes":
    print("Okay...")
    copy_tree('src/', path.expanduser('~'))
