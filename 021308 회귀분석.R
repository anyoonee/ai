# 단순선형 회귀 분석
# 문제 주행속도와 제동거리사이의 회귀식 구하기
head(cars)
class(cars)
str(cars)
dim(cars)
plot(dist~speed, data=cars)
# 산점도에서 선형관계가 분명하다.
# 주행속도가 증가할수록 제동거리도 증가한다.
# 형식 회귀모델 구하는 함수 lm(종속변수 ~ 독립변수, 데이터셋)
# 회기식은 y= wx + b
mod1 <- lm(dist~speed, cars)
mod1
coef(mod1)[1] # b = intercept값 
coef(mod1)[2] # speed 3.932402값이 w이다
# 그래서 y= 3.932402 X speed - 17.579095 회기식이 구해진다.

# 문 속도가 30일때 제동거리는?
y <- 3.932402 * 30 - 17.579095
y
# 문 속도가 50일때
y <- 3.932402 * 50 - 17.579095
y
# 문 속도가 70일때 
y <- 3.932402 * 70 - 17.579095
y

# 오차 꼭있다.
head(cars)
speed <- cars[,1]
speed
b<- coef(mod1)[1]
w<- coef(mod1)[2]
pred<-w*speed + b # 예상제동거리(회귀식에 의한 제동거리)
pred

#예상제동거리, 실제 제동거리, 오차 구하기를 데이터프레임으로 만들기
compare <- data.frame(pred,cars[,2],pred - cars[,2])
compare
colnames(compare) <- c('예상제동거리','실제제동거리','오차')
compare

#1 Loblolly 데이터셋에서 age를 이용해 height를 예측하는 단순선형 회귀모델을 만드시오.
head(Loblolly)
dim(Loblolly)
str(Loblolly)
# 종속변수는(y값?) height, 독립변수(x)는? age
#1단계
plot(height~age, data=Loblolly, col='blue')
#산점도에 대한 결과분석 : 선형관계가 분명하다.
#2단계회기식을 구하기 y=wx + b
model.2 <- lm(height~age, Loblolly)
#결과
w <- coef(model.2)[2]
b<- coef(model.2)[1]
#3단계age가 10,15,20일때 height예측
age <- 10
y.10 <- w*age + b
y.10
age <- 15
y.15 <- w*age + b
y.15
age <- 20
y.20 <- w*age + b
y.20

#2 airquality 데이터셋에서 Wind로 Temp를 예측하는 단순선형 회귀모델을 만드시오. 그리고 Wind가 10, 15, 20일 때, Temp를 예측하여 보시오.
head(airquality)
dim(airquality)
str(airquality)
plot(Temp~Wind, data=airquality, col='red')
model.3 <- lm(Temp~Wind, airquality)
model.3

w <- coef(model.3)[2]
y <- coef(model.3)[1]

Wind <- 10
y.10 <- w * Wind +b
y.10
Wind <- 15
y.15 <- w * Wind +b
y.15
Wind <- 20
y.20 <- w * Wind + b
y.20

#3pressure 데이터셋에서 온도(temperature)로 기압(pressure)을 예측하는 단순선형 회귀모델을 만드시오. 
head(pressure)
dim(pressure)
str(pressure)

model.4 <- lm(pressure~temperature,pressure) # lm(종속변수 ~ 독립변수, 데이터셋)
model.4

abline(model.4) # 회귀식으로 직선 그리기
w <- coef(model.4)[2]
b <- coef(model.4)[1]


#3단계온도가 65, 95, 155일 때 기압을 예측하여 보시오.
temperature <- 65
y.10 <- w * temperature +b
y.10
temperature <- 95
y.15 <- w * temperature +b
y.15
temperature <- 155
y.20 <- w * temperature +b
y.20
temperature <- 350
y.30 <- w * temperature +b
y.30
