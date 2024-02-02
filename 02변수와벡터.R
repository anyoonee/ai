2+3
(3+6)*8
2^3

pi = 3.14 # 변수 선언 방법1
sin(pi/2)

pi <- 3.14 # 변수 선언 방법2
pi

name <- '홍길동' # <- 단축키로  alt+'_' 누른다.
name

sqrt(-3)
#1-9
1976/24
#3
pi <- 3.14
area1 <- 10*10*pi
area1
area2 <- 12*12*pi
area2
area3 <- 15*15*pi
area3
#4
y <- log(sqrt(8),base=2)
y

#1~10까지 벡터로 만들기
num <- c(1,2,3,4,5,6,7,8,9,10)
num
#1~100까지 벡터로 만들기 (연속숫자)
num1 <- 1:100
num1
#200:500까지 벡터 만들기
num2 <- 200:500
num2
# 1 3 5 7 9..99까지 벡터 만들기 1~100까지 증가치 2인 벡터만들기
# 도움말 help(함수명)
help(seq)
seq(from=1, to=100, by=2)
seq(1,100,2) #약식
# 99 97 .. 1 까지 벡터
seq(from=99, to=1, by= -2)

# rep
help(rep)
rep(1:4,2)
rep(1:4, each=2)
rep(1:4,c(2,3,4,5))
# 결과는 4개만 나오게
rep(1:4, each = 2, length.out = 4)

# 100~200사이의 짝수로 된 vc.2
vc.2 <- seq(from=100, to=200, by=2)
vc.2

# 문제 6
vc.3 <- rep(TRUE,20)
vc.3

# 벡터에 이름 지정하기
score <-c(90,85,70)
score
names(score) #벡터의 이름 출력하기
# 벡터의 이름을 넣기
names(score) <- c('김수진','이영미','최진수')

#부분적으로 출력
score[1]
score['이영미']

v1 <- c(1,5,7,8,9)
v1
v1[2] <-3
v1
# 1,5번 인덱스값 바꾸기
v1[c(1,5)] <- c(10,20)
v1

x <-10:15
y <- 20:25
x
y
x+y
x*y

# 문제7 100~200 으로 구성된 벡터 d 생성
d <- 100:200
d
# d의 10번째 값 출력
d[10]
# d의 끝에서 10개의 값만 출력
d[]

# 문제 9
d1 <- 1:50
d2 <- 51:100
#(1)
d1
d2
#(2)
length(d2)
#(3)
d1+d2
d2-d1
d1*d2
d2/d1
#(4)
sum(d1)
sum(d2)
#(5)
sum(d1+d2)
#(6)
max(d2)
min(d2)
#(7)
mean(d1)
mean(d2)
mean(d2-d1)
#(8)
sort(d1,decreasing = TRUE)
#(9)


