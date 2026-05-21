#!/bin/bash
git log --no-merges --pretty=format:"%C(yellow)%h%C(reset) | %C(cyan)%ad%C(reset) | %C(green)%an%C(reset) | %C(magenta)%ar%C(reset) | %s" --date=format:"%Y-%m-%d %H:%M:%S" --shortstat
