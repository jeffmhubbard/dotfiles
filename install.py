#!/usr/bin/env python3

from distutils.dir_util import copy_tree
from os import path

if input("Install? (yes/no): ").lower().strip()[:1] == "yes":
    copy_tree('src/', path.expanduser('~'))
