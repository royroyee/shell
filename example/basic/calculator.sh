#!/bin/bash

echo "계산기 스크립트"
echo "사칙 연산을 수행합니다."

# 숫자 입력
read -p "첫 번째 숫자를 입력하세요: " num1
read -p "두 번째 숫자를 입력하세요: " num2

# 연산자 입력
read -p "연산자를 입력하세요 (+, -, *, /): " operator

# 입력된 연산자에 따라 연산 수행
case $operator in
    "+")
        result=$((num1 + num2))
        ;;
    "-")
        result=$((num1 - num2))
        ;;
    "*")
        result=$((num1 * num2))
        ;;
    "/")
        result=$((num1 / num2))
        ;;
    *)
        echo "올바르지 않은 연산자입니다."
        exit 1
        ;;
esac

# 결과 출력
echo "결과: $result"