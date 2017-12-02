#!/bin/bash

find . -type f -name '*.dat' -exec cat {} + >> data3b.data
