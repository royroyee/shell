# Process 고려하여 셸 조작하기

[참고 사이트](https://inpa.tistory.com/entry/LINUX-%F0%9F%93%9A-%ED%94%84%EB%A1%9C%EC%84%B8%EC%8A%A4-%EA%B4%80%EB%A6%AC-%EB%AA%85%EB%A0%B9%EC%96%B4-%F0%9F%92%AF-%EC%A0%95%EB%A6%AC-Foreground-Background#ps_%ED%94%84%EB%A1%9C%EC%84%B8%EC%8A%A4_%EB%8F%84%ED%91%9C_%ED%95%AD%EB%AA%A9)

## 프로세스의 이해 (ps)
`ps` 명령어는 리눅스에서 현재 실행중인 프로세스를 확인하는 명령어 (Process Status)

- bash 스크립트를 통한 자동화에도 자주 사용
- 주로 특정 프로세스에 시그널을 보내야 할 때 PID 를 식별하기 위해 사용
  - 또는 프로세스가 중단되면 다시 실행시키기 위해 감시하는 목적으로 사용

### ps 명령어 옵션
- `-e` : 전체 프로세스를 보는 옵션
- `-f` : 프로세스의 상태 정보를 모두 표시하는 옵션
  - UID, PID, 프로세스를 실행할 당시의 커맨드 라인도 표시
- `-ef` : 위 두 옵션을 같이 사용하고 싶을 때


### ps 프로세스 도표 항목
|프로세스 항목|의미|
|:---:|---|
|F|프로세스 플래그|
|S|프로세스 상태코드|
|UID|프로세스 소유자이름|
|PID|프로세스 고유식별자|
|PPID|부모프로세스의 PID|
|C|프로세서 사용률 %로 표기|
|PRI|프로세스의 우선순위. 높은값이 낮은 우선순위|
|NI|nice 값이며 19에서 -20값|
|SZ|프로세스 이미지가 차지하는 물리적 페이지 크기|
|WCHAN|대기중일때 커널 함수의 이름|
|STIME|프로세스가 시작한 시간|
|TTY|터미널의 종류|
|TIME|총 CPU 사용시간|
|CMD|프로세스의 실행 시 명령줄|


### 자세한 옵션 및 예제 작성 예정


---

## 프로세스의 부모 자녀 관계

### pstree
프로레스의 부모 자녀 관계를 확인할 때 사용하는 명령어

#### pstree -h : 부모 프로세스 강조 표시
````shell
$ pstree -h
````

#### pstree -p : 프로세스의 PID 표시
```
pstree -p
```

#### ps --forest : ps 출력에 부모 자녀 관계 정보 추가
```shell
ps --forest
```

---

## 내부 명령어와 외부 명령어

- 내부 명령어 : 실체가 되는 파일이 머신 어디에도 존재하지 않는 명령어
  - cd / set / read 등
- 외부 명령어 : 실체가 되는 파일이 존재하는 명령어
  - 대부분 /bin/ 아래에 존재
  - ex) sleep -> /bin/sleep 에 존재

### 내부, 외부 명령어 기능상 차이 알아보기
- echo 같은 경우 내부, 외부 명령어 두 가지 형태로 제공된다. 성능 상 차이점이 있을까?
```shell
# 외부 명령어 (/bin/echo)
time for i in {1..1000}; do /bin/echo "$i" > /dev/null; done

# 내부 명령어 (builtin 으로 명시)
time for i in {1..1000}; do builtin echo "$i" > /dev/null; done
```

- 내부 명령어의 실행속도가 훨씬 더 빠른 것을 확인할 수 있다.


---

## 명령어 치환과 프로세스 치환

### rev
```
$ echo "${a}"를 반대로 하면 "$(echo ${a} | rev)"
가나다라마를 반대로 하면 마라다나가
```
- rev : 입력의 각 행을 반전해서 출력

--

## 변수 로컬화

### 예제 1
```
$ n="XYZ"; for i in {A..C}; do n+=$i; echo $n; done; echo $n
XYZA
XYZAB
XYZABC
XYZABC
```
- 마지막 XYZABC는 for 문에 의해 n이 아예 바뀐 것을 의미한다.
#### 위에서 마지막에 XYZABC 가 아닌 XYZ 즉, n이 for문에 영향을 받지 않도록 출력하려면?
- 기존 for문에서는 서브쉘이 만들어지지 않는다.
  - 때문에 for 문 안에서의 변경 내용이 이후 처리에 그대로 반영된다. (n 값이 변경됨)
- 이러한 것을 원치 않을 때 서브쉘을 사용할 수 있다.

```shell
$ n="XYZ"; (for i in {A..C}; do n+=$i; echo $n; done); echo $n
XYZA
XYZAB
XYZABC
XYZ
```

---



---
## fork, System Call
