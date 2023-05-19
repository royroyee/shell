#!/bin/bash

# original : https://devraphy.tistory.com/424


LOGDIR=/var/log # 로그가 저장되어 있는 디렉토리
GZIPDAY=1 # 압축할 파일의 기한 설정
DELDAY=2

cd $LOGDIR # 로그가 저장되어 있는 디렉토리로 이동
echo "cd $LOGDIR" # 경로 이동을 터미널에 출력

# 경로 이동 후 실행할 명령어
sudo find . -type -f -name '*log.?' -mtime + $GZIPDAY -exec bash -c "gzip {}" \; 2> /dev/null
# `mtime`: 파일의 내용이 수정된 시간
# 수정된 날짜 + 1일 경과된 로그파일 삭제

sudo find . -type f -name '*gz' -mtime +$DELDAY -exec bash -c "rm -f {}" \; 2> /dev/null
# 수정된 날짜 + 2일 경과된 로그파일 삭제