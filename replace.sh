#!/bin/bash

name=test1

sed -i "s/test/$name/g" run 
sed -i "s/test/$name/g" start.sh
mv ./supervise.test ./supervise.${name}


