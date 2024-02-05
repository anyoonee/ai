# 매트릭스와 데이터 프레임

z <- matrix(1:30, nrow=5, ncol=6 )# byrow= T는 행으로 
z
z <- matrix(101:200, nrow = 10, ncol=10)
z

x <- 1:5 #1차원 벡터
y <- 8:12 # 1차원 벡터
x
y
# 2차원 매트릭스
# 칸으로 합치기
sum.xy <- cbind(x,y)
sum.xy

# 줄(row) 합치기
sum.xy <- rbind(z,y)
sum.xy

# 1~5
#101~105
#201~205
y <- 101:105
z <- 201:205
y
z
sum.xyz <- rbind(x,y,z)
sum.xyz

# 매트리스 한번에 만들기
z <- matrix(12:1, nrow=3, ncol=4, byrow=T)
z
rownames(z) <- c('v1','v2','v3') #행의이름
z
# 또는 1행씩 만들어서 합치기
v1 <- 12:9
v2 <- 8:5
v3 <- 4:1
z1 <- rbind(v1,v2,v3)
z1

#5를 검색하기
z1[2,4]
z1[3,2]

z1[1,]
z1[,2]
# 1행 3행
z1[c(1,3),]
# 2열, 4열
z1[ , c(2,4)]
z1[ , 2:4]

# 행이름 주기
# 열이름 주기
score <- matrix(c(90,85,69,78, 85,96,49,95, 90,80,70,60), nrow = 4, ncol = 3)
score
# 행이름 주기
rownames(score) <- c('John','Tom','Mark','Jane')
# 열이름 주기
colnames(score) <- c('English','Math','Science')
score[2,2]
score['Jane','Science'] #score[4,3]
score['Jane','English']
#Tom점수를 검색하기
score['Tom',]
#Math점수를 검색하기
score[ ,'Math']
#math 점수의 평균?
mean(score[,'Math'])
#학생(행)의 이름?
rownames(score)
#과목명(열)은?
colnames(score)

# 문제 1
# 매트리스 한번에 만들기
z <- matrix(12:1, nrow=3, ncol=4, byrow=T)
z
rownames(z) <- c('v1','v2','v3') #행의이름
z
#(2)
colnames(z) <- c('a1','a2','a3','a4')
z
#(3)
v4 <- c(1,3,5,7)
z <- rbind(z,v4)
z
#(4)
z[4,]
#(5)
z[2:4, c('a1','a3') ]

#(6)
rownames(z)[3]
#(7)
colnames(z)[3]

#데이터 프레임
city <- c('서울','도쿄','워싱턴')
rank <- c(1,3,2)
etc <- c(TRUE,TRUE,FALSE)
city.info <- data.frame(city,rank,etc)
city.info
city.info[2,'city']
city.info[1,'rank']
rownames(city.info)
colnames(ciry.info)

iris
head(iris, n=10)
tail(iris)

head(iris[,c(1:2)])
head(iris[, 'Petal.Width'])

dim(iris)
str(iris)
iris[,5]
unique(iris[,5]) #중복제거
table(iris[,"Species"]) #품종별로 갯수 세기

colSums(iris[,])

#(1) state.x77을 변환해 st에 데이터 프레임으로 저장
st <- data.frame(state.x77)
#(2) 내용출력
st
#(3) st의 열이름을 출력
colnames(st)
#(4) st의 행이름을 출력
rownames(st)
#(5) st의 행개수 열개수 출력
nrow(st)
ncol(st)
#(6) st의 요약정보를 출력
dim(st)

#(7) st의 행별 합계와 평균 출력
rowSums(st)
rowMeans(st)
#(8) st의 월별 합계와 평균
colSums(st)
colMeans(st)
#(9) Florida 주의 모든 정보를 출력
st['Florida',]
#(10) 50개주의 수입(Income) 정보만 출력
st[,'Income']
#(11) Texas주의 면적(Area) 출력
st['Texas','Area']
#(12) Ohio주의 인구(Population) 와 수입(Income) 출력
st['Ohio','Popoulation','Income']
#(13) 인구가 5000이상인 주
subset(st,Population>=5000)
#(14) 수입이 4500이상인 주의 인구, 수입, 면적 출력


#(16)
subset(st,Area>=10000 & Frost>=120)
#(17) 인구가 2000미만이고 범죄율 (murder)이 12미만인 주의 정보
subset(st,Popultaion<2000 & Murder<12)
#(18)
mean(subset(st,Illiteracy>=2.0)[,'Income'])
#(19)
ill.up2 <- mean(subset(st,Illiteracy>=2.0)[,'Income'])
ill.up2
ill.down2 <- mean(subset(st,Illiteracy<2.0)[,'Income'])
ill.down2
abs(ill.up2-ill.down2)

#(20)
max(st[,'Life.Exp']) # 73.6 최대값구하기
subset(st,Life.Exp == max(st[,'Life.Exp']))
rownames(subset(st,Life.Exp == max(st[,'Life.Exp'])))

#문제 3
#(1)
name <-c('Tom','Jane','Nick')
age <-c(20,23,26)
gender <-c('M','F','M')
height <-c(180,160,175)
student <-c(TRUE,TRUE,TRUE)
human <-data.frame(name,age,gender,height,student)
human
human <-c('Mary',24,'F',155,TRUE)



# 파일 불러오기
setwd("D:/ai/study_temp/r") # 파일 불러올 경로명
air <- read.csv('airquality.csv')
air
class(air)

air2 <- read.csv("D:/ai/study_temp/r/airquality.csv")
head(air2)
air2['Ozone']

air3 <- read.csv(file.choose()) # 대화상자로 열어서 파일 열어오기
head(air3)

#iris에서 Species == 'setosa'인 것만 저장하기
iris.setosa <- subset(iris, Species == 'setosa')
write.csv(iris.setosa,'irisfilename.csv')
