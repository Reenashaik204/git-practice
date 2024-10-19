#!/bin/bash

set -e #setting the automatic exit if we get error, set -ex for debug

failure () {
echo "failed at : $1 : $2"



}

trap 'failure "$LINENO" "$BASH_COMMAND"' ERR  #err is the error signal

echo "Hello world success"
echoooo "hello world failure"
echo "Hello world after failure"


