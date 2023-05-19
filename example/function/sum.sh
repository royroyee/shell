#!/bin/bash

function addNumbers() {
    local number1=$1
    local number2=$2
    local sum=$((number1+number2))
    echo "Summation is : $sum"
}

addNumbers 10 110