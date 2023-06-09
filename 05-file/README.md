# File

#### 각종 파일의 저장 위치
- 로그 파일 : /var/log/syslog (or auth.log)
- 설정 파일 : /etc/hostname
- 명령어 : /usr/bin/ping



## tail
파일의 마지막 행을 기준으로 지정한 행까지의 파일 내용 일부를 출력해주는 명령어
```shell
$ tail [옵션][파일명]

$ tail filename.txt
$ tail -f filename.txt
```

### 자주 사용하는 tail 옵션
| 옵션  | 설명                                                               |
|:------|:-------------------------------------------------------------------|
| -f    | 파일 업데이트 내용을 실시간으로 계속 출력합니다.                      |
| -n    | 파일의 마지막줄부터 지정한 라인 수까지의 내용을 출력합니다.            |
| -c    | 파일의 마지막부터 지정한 바이트 수만큼의 내용을 출력합니다.            |
| -q    | 파일의 헤더와 상단의 파일 이름을 출력하지 않고 내용만 출력합니다.      |
| -v    | 출력하기 전에 파일의 헤더와 이름을 먼저 출력한 후 파일의 내용을 출력합니다. |

```shell
$ tail -f mylog.log | grep 172.25.235.12
```
- 특정 ip 주소인 행만 **실시간**으로 조회

## 파일 시스템(디스크 여유 공간 및 사용량 확인)

### df
- 리눅스 시스템 전체의(마운트 된) 디스크 사용량 확인 명령어

```
$ df

$ df -h     # 메가,기가 단위로 확인 가능

$ df -Th    # -T:파일 시스템 타입 표시
```

### du
df 는 시스템 전체의 디스크 공간, **du 명령어는 특정 디렉토리를 기준**으로 디스크 사용량을 확인하는 명령어

```shell
$ du

$ du -h  # 마찬가지로 K,M,G 단위로 확인 가능

$ du -h/home # 특정 디렉토리 지정

$ du -sh/home  # s 옵션을 추가하면 서브 디렉토리 정보는 출력하지 않음
```


## 파일 사용

### cp 복사 
```shell
$ cp [옵션] [복사 할 디렉토리/파일] [복사 될 디렉토리/파일]
```

```shell
$ cp test.txt new_test.txt # 현재 디렉토리에 있는 test.txt 파일을 new_test.txt 이름의 파일로 복사

$ cp /usr/log/mylog.log new_log.log # /usr/log 디렉토리에 있는 mylog.log 를 현재 디렉토리의 new_log.log 에 복사

$ cp /usr/log/mylog.log /usr/log/new_log.log # /usr/log에 있는 new_log.log 에 복사
```
- 경로를 지정하지 않으면 현재 위치

### 자주 사용하는 cp 옵션
| 옵션  | 설명                                                                     |
|:------|:-------------------------------------------------------------------------|
| -i    | 복사될 파일이름이 이미 존재할 경우, 사용자에게 덮어쓰기 여부를 묻습니다.    |
| -b    | 복사될 파일이름이 이미 존재할 경우, 백업 파일을 생성합니다.                 |
| -f    | 복사될 파일이름이 이미 존재할 경우, 강제로 덮어쓰기합니다.                   |
| -r    | 하위 디렉토리까지 모두 복사합니다.                                       |
| -a    | 원본 파일의 속성과 링크 정보까지 모두 복사합니다.                          |
| -p    | 원본 파일의 소유자, 그룹, 권한 등의 정보까지 모두 복사합니다.              |
| -v    | 복사 진행 상태를 출력합니다.                                              |

```shell
$ cp -r old_folder new_folder   # old_folder 디렉토리를 new_folder 라는 이름의 디렉토리로 전체 복사(하위디렉토리까지)

$ cp * /usr/hwan    # 현재 위치에 있는 모든 파일 /usr/hwan 으로 복사
```
