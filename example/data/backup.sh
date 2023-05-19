#!/bin/bash

# original : https://devraphy.tistory.com/424

if [ -z $1 ] || [ -z $2 ]; then # 둘 중에 하나라도 인자가 없다면
  echo 사용법 : $0 sourcedir targetdir # 압축할 파일과 압축된 파일이 저장될 디렉토리를 입력하라는 help 옵션

else # 인자 2개가 모두 존재하는 경우
  SRCDIR=$1
  DSTDIR=$2
  BACKUPFILE=backup.$(date +%y%m%d).tar.gz # 생성될 백업파일의 이름을 지정 backup.년월일

  if [ -d $DSTDIR ]; then # 사용자가 지정한 DSTDIR이 존재하면
    tar -cvzf $DSTDIR/$BACKUPFILE $SRCDIR
  else # 압축파일이 저장될 디렉토리가 생성되어있지 않았다면
    mkdir $DSTDIR
    tar -cvzf $DSTDIR/$BACKUPFILE $SRCDIR
  fi
fi