#!/bin/bash

function sayHello() {
    local NAME=$1
    echo "Hello $NAME!!"
}

function sayGoodbye() {
    echo "Goodbye $1"
}

echo "Calling the sayHello function with param"
sayHello Roy

echo "Calling the sayGoodbye function"
sayGoodbye Roy

exit 0
