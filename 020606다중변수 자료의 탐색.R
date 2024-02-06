class(mtcars)
head(mtcars)
wt <- mtcars$wt
mpg <-mtcars$mpg
plot(wt,mpg,main="중량-연비 그래프",
     xlab='중량', y='연비', col='red',pch=19 )

vars <-c('mpg','disp','drat','wt')
target <- mtcars[,vars]
target
pairs(target)
head(iris)
iris.2 <- iris[,3:4]
iris.2
as.numeric(iris$Species) # as.numeric
point
color <-c('red','green','blue')
plot(iris.2, main="붓꽃의 꽃잎길이와 너비관계",
      pch=c(point),
      col=color)


library(mlbench)
data('BoostonHousing')
head(BoostonHousing)
str(BoostonHousing)

x<-c(2,3,5,6)
y<-c(4,3,3,10)
tbl <- data.frame(x,y)
tbl
cor(x,y) #상관계수

beers=c(5,2,9,8,3,7,3,5,3,5)
bal <- c(0.1,0.03,0.19,0.12,0.04,0.0095,0.07, 	# 자료 입력
         0.06,0.02,0.05)
tbl <- data.frame(beers,bal) 			# 데이터프레임 생성
tbl
plot(bal~beers,data=tbl) 			# 산점도
res <- lm(bal~beers,data=tbl) 		# 회귀식 도출
abline(res) 				# 회귀선 그리기
cor(beers,bal) 				# 상관계수 계산

#월별 지각생의 수를 선그래프로 표현
month=1:12
late=c(5,8,7,9,4,6,12,13,8,6,6,4)
plot(month,late,main="월별지각생수", type='o',lty=1,lwd=4,col='#10f001')

#시나리오
# 미국 보스턴 지역 주택가격에 영향을 미치는 항목은?

#외부에 있는 데이터셋의 패키지 다운로드
install.packages('mlbench')


#4. 데이터셋의 형태와 기본적인 내용 파악
str(myds)
table(myds$grp)
dim(myds)
class(myds)
summary(myds[,1:4])

#4.차트로 그리기 연속형 자료 히스토그램, boxplot
par(mfrow=c(2,3))
for(i in 1:5){
  hist(myds[,i], main=colnames(myds)[i],col='yellow',
       xlab='변량들',ylab='빈도수')
}
par(mfrow=c(2,3))
