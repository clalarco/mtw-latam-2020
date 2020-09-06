#!/bin/bash
set -x

current_dir=$(dirname "${BASH_SOURCE[0]}")
pushd ${current_dir}/..

docker build -t spacyexample .
