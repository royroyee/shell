# Linux Timestamp
리눅스에서 저장하는 다양한 시간 정보



### atime(access time, 접근 시간)
- 파일에 접근한 시간
- 파일을 open 할 때마다 갱신된다.
- vi, cat 명령으로 파일을 확인 시 atime 값이 변하게 된다.
- `ls -lu`

### mtime (modification time, 수정 시간)
- 파일의 내용이 수정될 때 mtime 시간이 변한다.
- `ls -l`

### ctime(change time, 변경 시간)
-inode 의 값(파일 속성, 권한, 크기)이 변경되면 ctime이 갱신된다.
- `ls -lc`

