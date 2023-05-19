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