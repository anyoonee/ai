# 다중선형 회귀분석
install.packages('car')
library(car)
head(Prestige)

#종속변수 - 연봉 - income
#독립변수 - 교육연수-education, 여성비율- women, 직군에대한 평판도- prestige

# 데이터셋은 1~4열
newData <- Prestige[,1:4]
head(newData)

#산점도로 변수간의 관계 확인
plot(newData, col='blue')

#회귀식 구하기 lm(종속변수~독립변수1 + 독립변수2 + 독립변수3, 데이터셋)
model.1 <- lm(income~education+women+Prestige, newData)
model.1
#회귀식 y=177,2 X education + (-50.9) X 
#해당 회귀식의 요약
summary(model.1)

#다중선형 회귀모델에서 변수 선택하기
install.packages('MASS')
library(MASS)
newData2 <- Prestige[,1:4]
head(newData2)
model.2 <- lm(income~women + Prestige + education, newData2)
model.3 <- stepAIC(model.2) # 독립변수 선택 진행

# 회귀식 - 다른모델을 만들어줌
# y=(-50.9) X women + 141.4 X prestige +(-253.8)
summary(model.3) # 0.6327 독립변수 2개 이용
summary(model.1) # 0.6323 독립변수 3개 이용

# 2개모델만들었다.

#예측하기
newData2
#문제 education 12.26 women 4.02 prestige 69.1일때 income 예측
education <- 12.26; women <- 4.02; prestige <- 69.1 
y1 = 177.2 * education + (-50.9) * women +141.4 * prestige + (-253.8)

# model.3으로 예측하기
y3 = (-50.9) * women + 141.4 * prestige + (-253.8)

#실제값은 25879
y1
y3

#문제 4 
head(state.x77)
dim(state.x77)
str(state.x77)
class(state.x77)
#1 문맹률(Illiteracy)와 고등학교 졸업률(HS.Grad)로 1인당 소득(Income)을 예측하는 다중선형 회귀모델을 만드시오.
#종속변수 : Income  독립변수:Illiteracy, HS.Grad
model.4 <- lm(Income~Illiteracy + HS.Grad, data=data.frame(state.x77))
model.4
#회귀식 y= -52.64 * Illiteracy + 44.55 * HS.Grad + 2131.33
summary(model.4)
#독립변수중에서 기여도가 높은 변수는? HS.Grad
#유의 수준은? 1.057e-05
#모델의 설명력?0.3597
#회귀식에서 독립변수를 HS.Grad만 구하기
model.5 <- lm(Income~HS.Grad, data=data.frame(state.x77))
model.5
summary(model.5)

#2 다중선형 회귀모델을 이용해 state.x77 데이터셋의 문맹률(Illiteracy)과 인구수(Population)로 1인당소득(Income) 예측
model.6 <- lm(Income~Illiteracy + Populationm, data=data.frame(state.x77))
model.6
#회귀식
summary(model.6)

#3 2에서 1인당 예측한 소득과 실제 state.x77 데이터셋의 1인당 소득(Income)이 얼마 차이 나는지?
head(state.x77)
Illiteracy <-2.1
Population <- 3615
pred = -468.63466 * Illiteracy + 0.03555 * Population + 4833.16224 # 예상값
pred # 3977.543
state.x77['Alabama','Income']

ds.3 <- data.frame(pred, state.x77['Alabama','Income'], pred - state.x77['Alabama','Income'])
colnames(ds.3) <- c('예상값','실제값','차이값')
ds.3

#문제 5 mlbench 패키지의 BostonHousing 데이터셋을 다른변수들을 이용해 medv예측하는 모델을 만드시오
library(mlbench)

data(BostonHousing)#데이터셋 불러오기

#1 전체변수를 이용해 평균 주택가격(medv)을 예측하는 회귀모델을 만들고 회귀식을 나타내시오
class(BostonHousing)
str(BostonHousing)
dim(BostonHousing)
#종속변수 : medv 독립변수 :chas제외한 나머지 변수들
#회귀식
ds <- BostonHousing[,-4] # 데이터셋 준비
head(ds)
model.5 <- lm(medv~. , data=ds) # 회귀식 y=Wx +b
model.5 # y= -0.113139 * crim + 0.047052 * zn + -17.366999 * indus + ... + 36.891960
summary(model.5)

#2 
library(MASS)
model.5.1 <- stepAIC(model.5)
summary(model.5.1)
y = -0.114056 * crim + 0.045742 * zn -16.469153 * nox + ..... + 36.620311

#3 만든 예측모델의 설명력(Adjusted R-squared)을 비교
summary(model.5)
summary(model.5.1)

#문제 6 mtcars 데이터셋에서 다른 변수들을 이용해 연비(mpg)를 예측하는 다중 회귀모델을 만드시오
#1 전체변수를이용해 연비(mpg)를 예측하는 회귀모델을 만들고 회귀식을 나타내시오
head(mtcars)
class(mtcars)
str(mtcars)
#종속변수: 연비(mpg), 독립변수: cyl~carb
#회귀식
model.6 <- lm(mpg~.,data=mtcars)
summary(model.6)
# y = -0.11144 * cyl + 0.01334 * disp + ...... + 12.30337

#2 연비 예측시 도움이 되는 변수들만 사용해 예측하는 회귀모델을 만들고 회귀식을 나타내시오.
model.6.1 <- stepAIC(model.6)
# 예측시 도움되는 변수 : am, qsec, wt
summary(model.6.1)
y = -3.9165 * wt + 1.2259 * qsec + 2.9358 * am + 9.6178

#3 
summary(model.6)
summary(model.6.1)
#결과분석보고서: 독립변수를 모두 사용한 model.6의 설명력은 0.8066이고, 불필요한 독립변수를 제거한 모델 model.6.1의 설명력은 0.8336으로 model.6.1을 채택한다.
#############################################
#로지스틱 회귀분석 - glm()
#y값이 범주형인것 분석하기(범주형의 자료를 정수형으로 변환. 월-1 화-2 동-1 서-2 남-3 북-4 setosa-1 vers)
#############################################

head(iris)
class(iris)
dim(iris)
str(iris)
iris.new <- iris
#범주형 자료를 숫자로 변환
iris.new$Species <- as.integer(iris$Species)
str(iris.new)
tail(iris.new)

# 회귀식을 구하기
# 종속변수:Species      독립변수:Sepal.Length Sepal.Width Petal.Length Petal.Width
model.7 <- glm(Species~Sepal.Length + Sepal.Width + Petal.Length + Petal.Width, data=iris.new)
model.7 <- glm(Species~. , data=iris.new) # 위에 것과 동일
summary(model.7)

#회귀식으로 쓰기

head(iris.new)

Petal.Length <- 1.4
Petal.Width <- 0.2
y = 0.22865 * Petal.Length + 0.60925 * Petal.Width + 1.18650
y

tail(iris.new)

Petal.Length <- 4.0
Petal.Width <- 2.5
y = 0.22865 * Petal.Length + 0.60925 * Petal.Width + 1.18650
y
summary(model.7)

#predict() 함수로 품종을 예측하기
unknown <- data.frame(rbind(c(5.1,3.5,1.4,0.2))) #예측하고 싶은 독립변수의 값을 넣기
unknown
names(unknown) <- names(iris)[1:4]
unknown
pred <- predict(model.7, unkown) # predict(데이터셋, 예측하려는 x값들)
pred

Sepal.Length <- 5.1
Sepal.Width <- 3.5
Petal.Length <- 1.4
Petal.Width <- 0.2

y = -0.11191 * Sepal.Length + -0.04008 * Sepal.Width+  0.22865 * Petal.Length +  0.60925 * Petal.Width + 1.18650
help(predict)

#문제7 UCLA 대학원의 입학데이터를 불러와 mydata에 저장후 
mydata <- read.csv("https://stats.idre.ucla.edu/stat/data/binary.csv")
mydata
head(mydata)
class(mydata)
#1 gre, gpa, rank를 이용해 합격 여부(admit)를 예측하는 로지스틱 모델을 만드시오(0:불합격, 1:합격)
# 독립변수 : gre, gpa, rank 종속변수: admit
# 회귀식
model.admit <- glm(admit~gre + gpa + rank, data=mydata)
summary(model.admit)


#2 mydata에서 합격 여부(admit)를 제외한 데이터를 예측 대상 데이터로 하여 (1)에서 만든 모델에 입력하여 합격 여부를 예측하고 실제값과 예측값을 나타내시오.
head( mydata )
# 예측값에 넣을 값 만들기
pred.val <- data.frame( mydata[ , 2:4] )
head( pred.val )
# predict() 예측값 구하기
pre <- predict(  model.admit,  pred.val ) # predict( 회귀모델명, 예측하려는값이 들어 있는 데이터셋)
pre
length( pre )
head( pre ) # 모델로 예측값 구한 것 
pre <- round( pre, 0 )
head( pre ) # 0 0 1 0 0 0
tail( pre ) # 0   0   0   0   0   0 
# 실제값은
head( mydata$admit ) # 0 1 1 1 0 1
tail( mydata$admit ) # 1 0 0 0 0 0

result <- data.frame(  예측값=pre, 실제값 = mydata$admit, 오차= pre - mydata$admit )
result
# 맞게 예측한 것의 갯수?
sum( result$예측값 == result$실제값)
# 틀리게 예측한 것의 갯수?
sum( result$예측값 != result$실제값)



#3 만들어진 모델의 예측 정확도를 나타내시오.
acc <- mean( result$예측값 == result$실제값)
acc


#문제8 mlbench 패키지의 PimaIndiansDiabetes 데이터셋은 17개의 변수로 당뇨 여부(diabetes)를 예측하기 위한 정보를 담도있다 로지스틱 회귀모델을 만드시오
library(mlbench)
data(PimaIndiansDiabetes) # 데이터셋 불러오기
head(PimaIndiansDiabetes)
str(PimaIndiansDiabetes)
dim(PimaIndiansDiabetes)

#1. set.seed(100)을 실행 후 전체의 임의의 60% 추출해 train에 저장 나머지는 test에 저장
#1단계 diabetes변수를 자료(범주형)를 숫자로 바꾸기
ds <- PimaIndiansDiabetes
ds$diabetes <- as.integer(ds$diabetes)
head(ds)
#2단계 임의로 60% 추출
dset.seed(100)
train <- sample(1:nrow(ds),nrow(ds)*0.6) # 768개중에서 460개를 행의 번호(인덱스)뽑음 
head( train.idx )

train <- ds[ train.idx,    ]
head( train )

test <-  ds[ -train.idx,  ]
head( test )


#2. 
## 로지스틱 회귀모델을 만들기
model.dia <- glm(diabetes~., data=train)
summary(model.dia)
## 회귀식 만들기
y=0.0211082 * pregnant + 0.0065026 * glucose -0.00232262 * pressure + 0.0123455 * mass + 0.1599404 * pedigree + 0.1158979

#3.회귀모델에 대해 test의 데이터를 입력해 당뇨여부를 예측하시오.
class(test)
pred <- predict(model.dia, test)
head(pred)
head(ds)
pred <- round(pred,0)
head(pred)
ds[1:20,]
#4 예측값과 실제 모델의 정확도가 어느정도 인지 확인
acc <- mean(pred == test$diabetes)
acc      
# 보고서: 모델은 75.59%의 정확도로 예측

#문제9 mlbench 패키지의 Glass 데이터셋은 9개의 변수로 잔디의 종류를 예측하는 로지스틱 회귀모델을 만드시오.
library(mlbench)
data(Glass)
dim(Glass)
class(Glass)
str(Glass)
head(Glass)

ds<-Glass
ds$Type <- as.integer(Glass$Type)

#1. set.seed(100)을 실행한 후 전체 데이터(관측값)에서 임의로 60%를 추출하여 train나머지 test
set.seed(100)
train.idx <- sample(1:nrow(ds), nrow(ds)*0.6)
train <- ds[train.idx,]
test <- ds[-train.idx,]
train

#2. train의 데이터로 잔디의 종류를 예측하는 회귀모델을 만들고 회귀식
model.glass <- glm(train$Type~. , data=train)
summary(model.glass)
y = 130.69743 * RI + 0.53712 *Na -0.52967 * Mg + ... + -233.21655

#3. test의 데이터를 입력해 잔디의 종류 예측
pred <- predict(model.glass, test)
pred
pred <- round(pred,0)
head(pred)

#4. 예측한 값과 실제 종류를 비교해 모델의 정확도가 어느정도인지 확인
acc <- mean(pred==test$Type)
acc
# 보고서: 모델의 정확도는 0.46이다. 낮은 정확도이므로 다시 모델을 정립할 필요가 있다. 독립변수를 다시 정비할 필요가 있다.



