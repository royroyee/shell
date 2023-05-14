# 기초 BASH 쉘 스크립트 예제

[참고자료](https://inpa.tistory.com/entry/LINUX-%EC%89%98-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-%ED%95%B5%EC%8B%AC-%EB%AC%B8%EB%B2%95-%EC%B4%9D%EC%A0%95%EB%A6%AC#%EA%B5%AC%EA%B5%AC%EB%8B%A8_%EC%B6%9C%EB%A0%A5) 

### 구구단 출력하기

```shell

#!/bin/bash

for i in {2..9}; do
  for j in {1..9}; do
    echo "$i * $j = $((i*j))"
   done
done
```
#### 이중 괄호
- 수식을 계산해야 할 때는 이중 괄호를 사용해야 한다.
  - 만약 $(i*j) 라고 작성하면 수식이 계산되지 않고 에러가 난다.
  - [이중 괄호](https://inpa.tistory.com/entry/LINUX-%EC%89%98-%ED%94%84%EB%A1%9C%EA%B7%B8%EB%9E%98%EB%B0%8D-%ED%95%B5%EC%8B%AC-%EB%AC%B8%EB%B2%95-%EC%B4%9D%EC%A0%95%EB%A6%AC#%EA%B5%AC%EA%B5%AC%EB%8B%A8_%EC%B6%9C%EB%A0%A5)


### 현재 디렉토리에 있는 txt 파일들 실행 권한 다 주기

```
#!/bin/bash

for file in `ls *.txt` #  역 따옴표
do 
    chmod +x $file
    echo "${file} 실행 권한 추가됨"
done
    
```
- `ls *.txt` : 역 따옴표로 묶어서 ls 로 실행된 명령어 결과를 출력 한다.
  - 역 따옴표로 묶지 않으면 ls 자체를 문자열로 인식 함



### cpu 모델명, os 종류 및 버전, kernel 버전을 출력
```
#!bin/bash

echo 'cpu model name'
echo `cat /proc/cpuinfo | grep model*` # cpu 모델명 출력
echo 'os version'
echo `cat /etc/issue` # OS 종류 및 version
echo 'kernel version'
echo `cat /proc/version` # kernel version
```


### 계산기(숫자 두개)
```
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
```

### 2초마다 현재시간 출력하기
```shell
#!/bin/bash

while true
do
echo `date`
sleep 2s
done
```


### 파일 옮기기
```
#!/bin/bash

# 이동할 디렉토리 경로 설정
dst_dir="new"

# 검색할 디렉토리 경로 설정
src_dir="."

# 이동할 파일 확장자 설정
target_ext=".txt"

# 목표 디렉토리가 없다면 생성하기
if [ ! -d "$dst_dir" ]; then
        mkdir "$dst_dir"
fi

# 검색 디렉토리에서 대상 확장자를 가진 파일 찾기
files=$(find "$src_dir" -name "*$target_ext")

# 찾은 파일들을 목표 디렉토리로 이동

for file in $files; do
        mv "$file" "$dst_dir"
        echo "이동 완료 : $file"
done

echo " 모든 파일 이동 완료"
```

