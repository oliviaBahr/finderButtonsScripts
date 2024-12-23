#!/bin/bash

currentDir=$(osascript -e 'tell application "Finder" to POSIX path of (insertion location as alias)')
open "warp://action/new_tab?path=$currentDir"
