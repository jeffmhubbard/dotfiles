#!/usr/bin/env python

import os
from distutils.dir_util import copy_tree

copy_tree('src/', os.path.expanduser('~'))

