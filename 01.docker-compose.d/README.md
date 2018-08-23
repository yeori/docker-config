# 변경

## 1. mariadb 추가

* `mariadb:10.3` 기준

## 1.1. 한국 시간으로 설정

* 아래 명령어로 한국 시각으로 설정함

`[명령어] ln -sf /usr/share/zoneinfo/Asia/Seoul /etc/localtime`

> tomcat, nginx 모두 설정해줌

## 1.2. mariadb/conf

* 설정 파일 모아놓은  디렉토리
* `my.cnf`가 `mariadb.cnf`를 include하고 있음
* `mariadb.cnf` -  encoding 지정
* `my.conf`에서 fine tuning 해야함

## 1.3. mariadb/query/init.sql

* db 초기화 쿼리
* 이 파일을 `docker-entrypoint-initdb.d` 디렉토리에 넣으면 docker 컨테이서 start(restart)시 자동으로 실행되므로 디비를 날릴 수 있음. 컨테이너로 옮겨담을 때 확장자를 변경해서 처리되지 않게 한 후 컨테이너 안으로 들어가서 직접 쿼리를 실행함




