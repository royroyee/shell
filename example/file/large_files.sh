#!/bin/bash

directory=$1
minimum_size=$2

# 단위 입력을 위한 변환 함수 (100M, 10K 등으로 입력)
function convert_to_bytes {
  local input=$1
  local unit=${input: -1} # 마지막 글자만(K,M,G)
  local size=${input%?}

  case $unit in
    "K" | "k")
      echo $(( $size * 1024 )) ;;
    "M" | "m")
      echo $(( $size * 1024 * 1024)) ;;
    "G" | "g")
      echo $(( $size * 1024 * 1024 * 1024 )) ;;
    *)
        echo $input ;;
  esac
}


minimum_size_bytes=$(convert_to_bytes ${minimum_size}) # 함수 호출

function list_large_files {
  local dir=$1
  local depth=$2
  local space=""

  for ((i=0; i<depth; i++))  # 단순 들여쓰기용
  do
      space+="    "
  done

  find "$dir" -type f -size +"$minimum_size_bytes"c -print0 | while IFS= read -r -d '' file
  # -type f : 파일 형식 찾기
  # -size + <bytes>c : bytes 크기 이상의 파일을 찾기(c:byte 단위 의미)
  # -print0 : 파일 이름 출력 및 이름 사이를 NUL 문자로 구분

  do
      echo "$space$file"
  done

  for subdir in "$dir"/*/
  do
      if [ -d "$subdir" ]; then
        next_dept=$((depth+1))
        list_large_files "$subdir" "$next_dept"
      fi
  done
}

list_large_files "$directory" 0

