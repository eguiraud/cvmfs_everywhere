#!/bin/bash
service autofs start
cvmfs_config setup
cvmfs_config probe
