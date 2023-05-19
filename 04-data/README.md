# Data

## 1. 테이블 형식 데이터 다루기(awk, join)
- [awk](https://github.com/royroyee/shell/tree/main/01-basic#10-awk)
#### table.txt
```
a 0.02 5 
b -0.65 3
b 10.05 -30
a 0.22 -30
```

### 2,3번째 열을 합산
```shell
$ cat table.txt | awk '{print $0, $2+$3}'
a 0.02 5  5.02
b -0.65 3 2.35
b 10.05 -30 -19.95
a 0.22 -30 -29.78
```

### 세로로 집계
```shell
$ cat table.txt | awk '{a+=$2;b+=$3}END{print "합계",a,b}'
합계 9.64 -52
```
- `END` : `awk`가 마지막의 행의 처리를 마친 후 실행

### a,b 별로 세로로 집계
```
$ cat table.txt | awk '{x[$1]+=$2;y[$1]+=$3}END{for(k in x){print k"합계",x[k],y[k]}}'
a합계 0.24 -25
b합계 9.4 -27
```



## tar
- 파일 또는 디렉토리를 압축 및 압축해제에 사용되는 명령어

### tar 주요 옵션
x : 묶음을 해제
c : 파일을 묶음
v : 묶음/해제 과정을 화면에 표시
z : gunzip을 사용
f : 파일 이름을 지정

### 압축
```
$ tar -cvzf [압축된 파일 이름] [압축할 파일, 폴더 명]
```

### 압축을 풀 때
```shell
$ tar -xvzf [압축 해제할 압축 아카이브 명]
```