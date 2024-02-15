mydata <- iris[,1:4]
fit <- kmeans(x=mydata, centers=3)
fit
fit$cluster # 각 데이터에 대한 군집번호
head(iris)
iris[107:127,]
fit$centers # 중심좌표
fit$size # 각 군집의 포인트 수 (관찰값 수)
fit$totss

#군집 시각화
library(cluster)
clusplot(mydata,fit$cluster,color=T, shade=T, labels=2, lines=0)
clusplot( mydata, fit$cluster, color=T, shade=T, labels=2, lines=1 )
# clustplot(  mydata 군집화 대상 데이터셋, 
#             
#             fit$cluster 군집화 결과에서 관측값별 군집번호, 
#             
#             color=T 군집을 표시하는 원의 색깔을 군집별로 다르게 할 지 여부 결정, 
#             
#             shade=T 군집을 표시하는 원안에 빗금을 표시할지 여부를 결정, 
#             
#             labels=2 군집화 대상 데이터셋에서 개별 관측값을 그래프상에 어떻게 나타낼지를 지정 1:관측값을 ○ △ + 와 같은 기호로 표시 2: 관측값을 숫자로 표시, 
#             
#             lines = 0 군집의 중심점과 중심점을 연결하는 선을 표시할지 여부를 결정 0:표시하지 않음 1: 표시함 ) 

# 2번 군집 자료를 보기
subset( mydata, fit$cluster==2 )
fit$size
subset( mydata, fit$cluster==3 )

dim(iris)
str(iris)
mydata <- iris[,1:4]
fit <- kmeans(x=mydata,centers=3)
# 군집의 갯수는 어떻게? 1)루트(관찰값) 갯수보다 작게 2) str(데이터셋) factor가 있다면 levels수 
fit
fit$cluster
fit$centers
fit$size

#군집시각화
library(cluster)
clusplot(mydata, fit$cluster,color)
subset(mydata,fit$cluster == 2)

#표준화하기
std <- function(x){
  return((x-min(x)) / (max(x)-min(x)) )
}

mydata <- apply(iris[,1:4],2,std) # apply(데이터셋,2-열,1-행,함수명)
mydata

ds <- data.frame(name=c('A','B'),키=c(180,170),시력=c(1.2,0.9))
ds
ds.std <- apply(ds[,-1],2,std)
ds.std


###############################
## 분류
###############################
library(class)
dim(iris)

# 관찰값 150개를 분석가에게 주었다
# train 150*60%, test 150*40%

idx <- c(1:25, 51:75, 101:125)
idx
ds.tr.que <- iris[idx,1:4] #학습용문제 50개준비
ds.tr.ans <- iris[idx,5] #학습용문제 답안지 50개 준비
ds.tr.ans

ds.test.que <- iris[-idx,1:4] # 시험문제 100개준비
ds.test.ans <- iris[-idx, 5] # 시험문제 답안지

pred <- knn(ds.tr.que, ds.test.que, ds.tr.ans, k=3, prob=T)

pred

acc <- mean(pred == ds.test.ans) #머신러닝이 예측한 것과 진짜 답을 맞추어보기
acc
table(pred,ds.test.ans)

#문제 1
head(Seatbelts)
class(Seatbelts) # 시계열 ts "matrix" "array"
dim(Seatbelts)
str(Seatbelts)

# 군집의 수는 2로

# Seatbelts 데이터셋에서 마지막에 있는 law 열은 제외하고 군집화 실행
ds <- Seatbelts[,1:7]
head(ds)

# Seatbelts는 각 변수(열)의 값들의 단위의 차이가 많이 나기 때문에 0~1 표준화 실시
ds.std <- apply(ds,2,std)
head(ds.std)
fit <- kmeans(x=ds.std,centers =2)
fit

library(cluster)
clusplot(ds.std, fit$cluster, color = T, shade=T, labels=1, lines=1)
subset(ds.std, fit$cluster ==2)
fit$centers

#문제2
library(mlbench)
data("Sonar") # 데이터셋 불러오기
head(Sonar)
dim(Sonar)
class(Sonar)
str(Sonar)
# 군집의 수는 2

# Sonar 데이터셋에서 마지막에 있는 class 열은 제외
ds <- Sonar[,-61]
fit<- kmeans(ds,centers=2)
fit
clusplot(ds,fit$cluster,color=T,shade=T,lablels=2,lines=1)

#문제3 swiss데이터셋에 대해 k-평균 군집화를 실시하고 그래프로 출력
#군집의 수는 3
head(swiss)
fit <- kmeans(swiss,centers=3)
fit
clusplot(swiss,fit$cluster, color=T, shade=T, lablels=2, lines=1)

#문제 4 R에서 제공하는 rock데이터셋에 대해 k-평균 군집화를 실시
#군집의 수는 3
head(rock)
dim(rock)

std <- function(x){
  return((x-min(x)) / (max(x)-min(x)) )
}

ds.rock <- apply(rock,2,std)
ds.rock

fit <- kmeans(ds.rock,centers=3)
fit
clusplot(ds.rock,fit$cluster, color=T, shade=T, lablels=2, lines=1)

# 문제 5 mlbench패키지에서 soybean데이터셋에 k-최근접이웃알고리즘을 이용
library(mlbench)
data("Soybean")
head(Soybean)
dim(Soybean)
class(Soybean)
str(Soybean)

# 결측값을 제거
ds.new <- Soybean[complete.cases(Soybean), ]
dim(ds.new)
head(ds.new)
# soybean 데이터셋에서 첫번째에 있는 class열이 그룹정보
## 답안지

#soybean 데이터셋에서 짝수 번째 데이터(관측값)를 훈련용, 홀수번째는 테스트용
idx<-seq(1,nrow(ds.new),2)

#학습문제(훈련용데이터)
ds.train.question <- ds.new[-idx,2:36]
head(ds.train.question)

#학습답안지
ds.train.answer <- ds.new[-idx,1]
head(ds.train.answer)

#시험문제(테스트용 데이터)
ds.test.question <- ds.new[idx,2:36]

#시험답안지
ds.test.answer <- ds.new[idx,1]

#
library(class)
pred <- knn(ds.train.question, ds.test.question, ds.train.answer, k=3)
pred

acc <- mean(pred == ds.test.answer)
acc
#분석보고서: k-최근접 이웃에서 k를 5일때 정확도는 0.933

pred <- knn(ds.train.question, ds.test.question, ds.train.answer, k=5)
pred

acc <- mean(pred == ds.test.answer)
acc
#분석보고서: k-최근접 이웃에서 k를 5일때 정확도는 0.92

pred <- knn(ds.train.question, ds.test.question, ds.train.answer, k=7)
pred

acc <- mean(pred == ds.test.answer)
acc
#분석보고서: k-최근접 이웃에서 k를 5일때 정확도는 0.906

#########################################
#k-fold 교차검증 knn 예측을 높이기 위해 데이터셋을 골고루 뽑기
#########################################
install.packages('cvTools')
library(cvTools)
k <- 10
folds <- cvFolds(nrow(iris),K=k)
folds

acc <- c()
for(i in 1:k){
  ts.idx <- folds$which == i #folds$which : 각 열에 인덱스 순열이 포함된 정수 행렬
  ds.train.question <- iris[-ts.idx, 1:4] #학습문제 훈련용문제
  ds.train.answer <- iris[-ts.idx,5] #학습문제 답안지 훈련용답안지
  ds.test.question <- iris[ts.idx,1:4]
  ds.test.answer <- iris[ts.idx,5] # 시험문제 답안지
  pred <- knn(ds.train.question, ds.test.question, ds.train.answer, k=5) # k=5 최근접
  acc[i] <- mean(pred == ds.test.answer)
  
}



# 문제 7 mlbench 패키지에서 재공하는 BreastCancer 데이터셋에 대해 k-최근접 이웃알고리즘
library(mlbench)
data("BreastCancer")
head(BreastCancer)
dim(BreastCancer)
class(BreastCancer)
str(BreastCancer)

#BreastCancer 데이터셋의 결측값 제거
ds <- BreastCancer[complete.cases(BreastCancer), ]
head(ds)
#BreastCancer 데이터셋에서 마지막에 있는 Class 열이 그룹정보
ds.new <- ds
head(ds.new)
dim(ds.new)


# k-최근접 이웃에서 k는 5
# 10-fold 교차 검증 방법
library(class) # knn()
library(cvTools) #cvFolds()
folds <- cvFols(nrow(ds.new),k=10)
head(folds)
acc <- c() # 각 폴드에 대한 정확도를 담아둘 벡터

for(i in 1:10){
  #시험용 자료의 인덱스
  idx <- folds$which == i
  #학습용 문제
  ds.train.q <- ds.new[-idx,1:10]
  head(ds.train.q)
  #학습용답안지
  ds.train.a <- ds.new[-idx,11]
  head(ds.train.a)
  #시험용문제
  ds.test.q <- ds.new[idx,1:10]
  #시험용답안지
  ds.test.a <- ds.new[idx,11]
  pred <- knn(ds.train.q, ds.test.q, ds.train.a,k=5)
  acc[i] <- mean(pred )
}
acc
mean(acc)


#문제 8 mlbench PimaIndiansDiabetes
library(mlbench)
data("PimaIndiansDiabetes")
head(PimaIndiansDiabetes)
dim(PimaIndiansDiabetes)
str(PimaIndiansDiabetes)
class(PimaIndiansDiabetes)

#PimaIndiansDiabetes 데이터셋에서 dabetes열이 그룹정보
#k-최근접이웃에서 k는 5로
# 10-fold 교차 검증 방법으로 
ds <- PimaIndiansDiabetes[complete.cases(PimaIndiansDiabetes)]
folds <- cvFolds(nrow(ds),k=10)
acc<-c()
for(i in 1:10){
  #시험용 자료의 인덱스
  idx <- folds$which == i
  #학습용 문제
  ds.train.q <- ds.new[-idx,1:8]
  head(ds.train.q)
  #학습용답안지
  ds.train.a <- ds.new[-idx,9]
  head(ds.train.a)
  #시험용문제
  ds.test.q <- ds.new[idx,1:8]
  #시험용답안지
  ds.test.a <- ds.new[idx,9]
  pred <- knn(ds.train.q, ds.test.q, ds.train.a,k=5)
  acc[i] <- mean(pred == ds.test.a)

}

acc
mean(acc)

#문제 9 
library(mlbench)
data("Vehicle")
head(Vehicle)
dim(Vehicle)
class(Vehicle)
str(Vehicle)

ds<-Vehicle[complete.cases(Vehicle),]
folds <- cvFolds(nrow(ds), k=10)
acc <- c()
for(i in 1:10){
  #시험용 자료의 인덱스
  idx <- folds$which == i
  #학습용 문제
  ds.train.q <- ds.new[-idx,1:18]
  head(ds.train.q)
  #학습용답안지
  ds.train.a <- ds.new[-idx,19]
  head(ds.train.a)
  #시험용문제
  ds.test.q <- ds.new[idx,1:18]
  #시험용답안지
  ds.test.a <- ds.new[idx,19]
  pred <- knn(ds.train.q, ds.test.q, ds.train.a,k=5)
  acc[i] <- mean(pred == ds.test.a)
  
}
acc
mean(acc)

#문제 10
library(mlbench)
data("Vowel")
head(Vowel)
dim(Vowel)
class(Vowel)
str(Vowel)

ds<- Vowel[complete.cases(Vowel),]
folds <- cvFolds(nrow(ds), k=10)
acc <- c()

for(i in 1:10){
  #시험용 자료의 인덱스
  idx <- folds$which == i
  #학습용 문제
  ds.train.q <- ds.new[-idx,1:10]
  head(ds.train.q)
  #학습용답안지
  ds.train.a <- ds.new[-idx,11]
  head(ds.train.a)
  #시험용문제
  ds.test.q <- ds.new[idx,1:10]
  #시험용답안지
  ds.test.a <- ds.new[idx,11]
  pred <- knn(ds.train.q, ds.test.q, ds.train.a,k=5)
  acc[i] <- mean(pred == ds.test.a)
  
}
acc
mean(acc)


