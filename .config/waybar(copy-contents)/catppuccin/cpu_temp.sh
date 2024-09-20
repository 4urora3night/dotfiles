#!/bin/bash

# Try to extract the CPU temperature using grep and regex
sensors | grep -oP 'Package id 0.*?\+\K[0-9]+'

