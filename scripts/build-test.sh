#!/bin/bash
#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
pushd ${current_dir}/..

docker build -t spacyexample-test -f test.Dockerfile .
