# 환경변수


### 환경변수란?
- 현재 사용하고 있는 쉘의 실행파일에 대한 위치를 저장하는 변수
- 환경변수는 변수명과 값으로 구성된다.

### 환경변수 
| 변수     | 설명                                       |
| -------- | ------------------------------------------ |
| HOME     | 사용자 홈디렉토리                          |
| PATH     | 실행파일을 찾는 경로                      |
| LANG     | 프로그램 사용시 기본으로 지원되는 언어     |
| PWD      | 현재 작업 디렉토리                        |
| TERM     | 로그인 터미널 타입                        |
| SHELL    | 사용하는 쉘                               |
| USER     | 사용자 이름                               |
| HISTFILE | history 파일 경로                         |
| HISTSIZE | history 파일 크기                         |
| BASH     | 사용하는 bash 쉘 경로                     |

## 환경변수 설정(set, env, export)

### set
- 사용자 환경 변수 설정 및 조회
- 현재 쉘 세션에 정의되어 있는 모든 변수 설정 및 조회 가능 (환경변수 포함)

옵션   | 비고
------|---------------------------
-a    | 생성, 변경되는 변수를 export 함
-e    | 오류가 발생하면 스크립트 종료
-x    | 수행하는 명령어를 출력 후 실행
-c    | 다음의 명령을 실행. ex) bash -c "echo 'A'". bash -c date
-o    | 옵션 설정





### env
- 전역 변수 설정 및 조회

### export
- 사용자 환경 변수를 전역 변수로 설정

### 환경변수에 저장된 값 조회
```shell
$ echo $HOME
/root

$ echo $PATH
/home/hwan/.vscode-server/bin/6261075646f055b99068d3688932416f2346dd3b/bin/remote-cli:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games:/snap/bin
```

### set vs env
```
$ PARAM_01=hello
$ env | grep PARAM_01
$ set | grep PARAM_01
```

- PARAM_01 : 쉘 변수
  - 환경 변수, 전역 변수, 지역 변수도 아닌 단순 현재 쉘 프로세스 내에서만 유효한 변수
  - 다른 프로세스에서는 사용 불가

- env 는 전역 변수를 조회할 수 있으므로, PARAM_01 을 읽지 못함
- set 은 현재 쉘 변수를 설정 및 조회할 수 있으므로 값을 읽음


