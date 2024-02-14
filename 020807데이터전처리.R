# 1. 결측값 
z <- c(1,2,3,NA, 5,NA, 8)
sum( z )
is.na( z )
sum(z, na.rm=T )

m <- mean( z, na.rm=T )
m
sd( z, na.rm = T )
z[ is.na(z)  ] <- 0 # TRUE이면 0으로 대체 
z
# 결측값을 평균으로 대체하기 
z[ is.na(z) ] <- m
z
# 결측값을 대체한 것을 새로운 벡터로 저장하기
z.new <- as.vector( z )

DF <- data.frame(x = c(1, 2, 3), y = c(0, 10, NA))
DF
na.omit(DF) # 결측값이 있는 것을 제외하고 정상값만 반환하기 

z <- c(1,2,3,NA, 5,NA, 8)
z
na.omit.new <- na.omit( z )
na.omit.new
na.new.ds <- as.vector( na.omit.new)
na.new.ds

# 2차원 결측값 처리 방법 찾기, 제거, 수정
x <- iris[1:50, ]
x
x[1,2] <- NA; x[1,3] <- NA; x[2,3] <- NA; x[3,4] <- NA;
head(x)

# 찾기 - 반복문 사용
## 열에 있는 것 결측값의 갯수 세기
ncol(x) # 컬럼의 수 
for( i in 1:ncol(x) ){
  this.na <- is.na( x[ , i ]   ) # TRUE FALSE 
  cat( i, '열  ', sum( this.na ), '\n')
}

# # result
# 1열 0 
# 2열 1
# 3열 2
# 4열 1
# 5열 0

## 행에 있는 것 결측값의 갯수 세기( 1행~5행까지 구하기 )
nrow(x) # 행의 수 
for( i in 1:5 ){
  this.na <- is.na( x[ i ,  ]   ) # TRUE FALSE 
  cat( i, '행  ', sum( this.na ), '\n')
}


# # result
# 1행 2 
# 2행 1
# 3행 1
# 4행 0
# 5행 0

ds <- mtcars
ds[2,3] <- NA; ds[3,1] <- NA; ds[2,4] <- NA; ds[4,3] <- NA;

# (1) 각 열별로 결측값이 몇 개인지 출력하시오.
ncol(ds)
for( i in 1:ncol(ds) ){
  this.na <- is.na( ds[ , i] )
  cat( i, '열 ' , sum( this.na ), '개 \n')
}

# (2) 결측값이 포함된 행들의 데이터를 출력하시오.
nrow( ds )

idx <- c()
for( i in 1:nrow( ds ) ) {
  if (  sum( is.na( ds[ i, ]  )  )  > 0   ) { # 결측값이 있는 행의 인덱스 구한다. 
    idx <- c( idx, i ) # 인덱스를 넣어준다 
  }
}
idx 
ds[ idx,  ]

head(ds)

# (3) 결측값이 포함된 행은 몇 개인지 출력하시오.
# 방법1 (2)의 결과로 풀기
length( idx )
# 방법2 (2)없이 풀기 
cnt <- 0
for( i in 1:nrow( ds ) ) {
  if (  sum( is.na( ds[ i, ]  )  )  > 0   ) { # 결측값이 있는 행을 구한다. 
    cnt <- cnt + 1 # cnt변수로 갯수를 센다. 
  }
} 
cnt

# (4) 결측값이 포함된 행들을 제외하고 새로운 데이터셋 ds.new를 만들어보시오.
head( ds )
dim( ds )
ds.new <-  na.omit( ds )
head( ds.new )
dim( ds.new )


###########################################
# 특이값( 이상값 )
###########################################
st <- data.frame( state.x77 )
boxplot( st$Income )

# 이상값 구하기 
# 문 Income 이상값은 얼마?
income.out <- boxplot.stats( st$Income )$out
income.out
boxplot( st$Population )
# 문 Population 이상값은 얼마?
popu.out <- boxplot.stats( st$Population )$out
popu.out

# 이상값 제거하기
# 방법 결측 만들고 결측을 제거하기
income.out <- boxplot.stats( st$Income )$out
income.out
st$Income[  st$Income == income.out     ] <- NA
st$Income

popu.out <- boxplot.stats( st$Population )$out
st$Population

#  st$Population 값중에서 popu.out안에 변수값이 있으면 참이고 참이면 NA로  대체        
st$Population[ st$Population %in%  popu.out ] <- NA
st$Population

# NA제거하기 
dim( st )
st.new <- st[ complete.cases( st ),    ]  # NA가 들어 있는 행을 제거하기
dim( st.new )

st.new1 <- st[ , complete.cases( st )  ] # 에러 발생

st.new2 <- na.omit( st )
head( st.new2 )
dim( st.new2 )

# 문제2
# 2. 다음과 같이 mtcars 데이터셋을 mt에 저장한 후 다음 문제를 해결하기 위한 R 코드를 작성하시오.

mt <- data.frame(mtcars)

# (1) mt의 각 변수(열)들에 대해 특이값이 존재하는지 상자그림을 그려 확인하시오.
dim( mt )
boxplot( mt[, 1] ) 
boxplot( mt[, 2] )
boxplot( mt[, 3] )
boxplot( mt[, 4] ) # 특이값 있다
boxplot( mt[, 5] )
boxplot( mt[, 6] ) # 특이값 있다
boxplot( mt[, 7] ) # 특이값 있다
boxplot( mt[, 8] )
boxplot( mt[, 9] )
boxplot( mt[, 10] )
boxplot( mt[, 11] ) # 특이값 있다

# (2) 특이값이 존재하는 경우 이상치를 NA로 대체하여 저장하시오.
boxplot.stats( mt[,4])$out

for( i in 1:ncol( mt )) {
  outlier <- boxplot.stats( mt[,i])$out
  if( length( outlier ) > 0  ) {
    mt[  mt[  ,i] %in%   outlier, i  ] <- NA
  }
}

mt[, 4 ]  
mt 
# (3) mt에서 NA가 존재하는 행들을 제거하여 mt2에 저장하시오.
mt2 <-mt[ complete.cases(mt),    ]
mt2

mt
mt3<- na.omit( mt )
mt3


# 3. R에서 제공하는 airquality 데이터셋에 대해 다음의 문제를 해결하기 위한 R 코드를 작성하시오.

# (1) airquality를 AQ에 저장하시오.
AQ <- airquality 
head( AQ )
class( AQ )
dim( AQ )
str( AQ )
# (2) AQ에서 열별로 NA의 개수를 출력하시오.
for( i in 1:ncol( AQ ) ) {
  cnt <- sum(  is.na( AQ[  , i  ]))
  cat( names( AQ[i] ) , '의 결측값 : ', cnt, '개 ', '\n' )
}

# result는? 
Ozone :  ?개
Solar.R : ?개

# (3) AQ에서 행별로 NA의 개수를 출력하시오.
for( i in 1:nrow( AQ) ){
  cnt <- sum( is.na( AQ[ i,   ] ))
  cat( i, '행의 결측값의 갯수 : ' , cnt, '개 \n')
}

# (4) AQ에서 NA를 포함하지 않은 행들만 출력하시오.
AQ.notNA <- na.omit( AQ )
AQ.notNA

AQ.notNA2 <- AQ[ complete.cases(AQ), ]
AQ.notNA2

# (5) AQ에서 NA를 NA가 속한 열의 평균값으로 치환하여 AQ2로 저장하고, AQ2의 내용을 출력하시오.
col.mean = colMeans( AQ, na.rm=T )  # NA를 빼고 칸의 평균을 구함, NA없는 칸은 칸의 평균 
col.mean
AQ2 <- AQ
for( i in 1:ncol( AQ2) ){
  AQ[  is.na( AQ2[ , i]   )    , i ] <- col.mean[ i ]
}
head( AQ )

######################################
## 정렬
######################################
head( iris )
sort( iris$Sepal.Length  )
sort( iris$Sepal.Length, decreasing = T )

order( iris$Sepal.Length ) # iris$Sepal.Length으로 오름차순 정렬한다. 원래 행의 위치를 반환한다
head( iris, n = 15 )

iris[  order( iris$Sepal.Length ) ,  ]
iris[  order( iris$Sepal.Length, decreasing = T ) ,  ]

# 4. R에서 제공하는 state.x77 데이터셋에 대하여 다음 문제를 해결하기 위한 R 코드를 작성하시오.

# (1) state.x77 데이터셋을 Population(인구수)를 기준으로 오름차순 정렬하시오.
class( state.x77 ) # 자료형은 matrix
dim( state.x77 )
order( state.x77[,'Population'] )
state.x77[  order( state.x77[,'Population'] ),   ]
head( state.x77 )

# (2) state.x77 데이터셋을 Income(소득)을 기준으로 내림차순 정렬하시오.
order( state.x77[, 'Income'], decreasing = T )
state.x77[ order( state.x77[, 'Income'], decreasing = T ),  ]

# (3) Illiteracy(문맹률)가 낮은 상위 10개 주의 이름과 문맹률을 출력하시오.
# 문맹률 내림 차순
temp <- state.x77[ order( state.x77[, 'Illiteracy'], decreasing = T),  ]
head( temp, n=15)
temp[ 1:10, 'Illiteracy'] 

######################################
## 분리 - 그룹별로 분석하기 
######################################

str( iris ) 
sp <- split( iris, iris$Species ) # split( 데이터셋, 분류하려는 열이름) 품종별로 잘라내기(구분) 
sp
summary( sp )
sp$setosa
sp$versicolor

# 5. R에서 제공하는 mtcars 데이터셋에 대하여 다음 문제를 해결하기 위한 R 코드를 작성하시오
# 
# (1) mtcars 데이터셋을 gear(기어)의 개수에 따라 그룹을 나누어 mt.gear에 저장하시오.(단, split() 함수를 사용하시오.)
mt.gear <- split( mtcars, mtcars$gear )
mt.gear
str(mtcars)
# (2) mt.gear에서 gear(기어)의 개수가 4인 그룹의 데이터를 출력하시오.
mt.gear$`4` 

# (3) mt.gear에서 gear(기어)의 개수가 3인 그룹과 5인 그룹의 데이터를 합쳐서 mt.gear.35에 저장하고 내용을 출력하시오.
mt.gear.3 <- mt.gear$`3`
mt.gear.5 <- mt.gear$`5`
mt.gear.35 <- rbind( mt.gear.3,  mt.gear.5 ) 
mt.gear.35

# (4) mtcars 데이터셋에서 wt(중량)가 1.5~3.0 사이인 행들을 추출하여 출력하시오

# subset( 데이터셋, 조건절 ) 조건에 만족하는 데이터를 추출한다. 
subset( mtcars, wt>=1.5 & wt<=3.0 )


# R에서 내장된 데이터셋을 사용하는 데 오류가 난다면 
# 
# library( datasets )
# data( iris )
# data(mtcars)

subset( iris, Species == 'setosa')
subset( iris, iris$Sepal.Length > 7.6, select=c(Sepal.Length,Species  )  ) # 또는  
subset( iris, iris$Sepal.Length > 7.6  )[ ,  c('Sepal.Length','Species' )] 


x<-1:100
set.seed(100) # 임의의 추출할때 씨앗
sample(x,size=10,replace=F)
idx<-sample(1:nrow(iris), size=20,replace=F)
idx
iris[idx,]


#문제8
# mtcars 데이터셋에서 10개의 행을 임의로 추출하여 mt10에 저장하고, 나머지 행들은 mt.other에 저장하시오.
set.seed(100)
idx<-sample(1:nrow(mtcars), size=10, replace = F)
idx

mt10<- mtcars[idx,]
mt10

mt.other<-mtcars[-idx,]
mt.other

#문제 9
# iris 데이터셋에서 각 품종별로 10개의 행을 임의로 추출하여 iris.10에 저장해 iris.10의 내용을 출력하시오
idx2 <- sample(1:nrow(iris), size=10, replace=F)
idx2
iris10 <- iris[idx2,]
iris10

#######################################
## 조합 - combination (데이터셋, 뽑는갯수) 경우의 수
######################################
combn(1:5,3)
combn(1:4,2)

#문제 11 iris 데이터셋에서 3개의 Species(품종)을 2개씩 짝지어 출력
sp <- unique(iris$Species)
sp
combn(sp,2)
#문제 12 banana,apple,melon,peach, mango를 3개씩 짝지어 출력
fruits <- c('banana','apple','melon','peach', 'mango')
fruits
combn(fruits,3)

#######################################
## 집계 - aggregate(데이터셋, by=그룹명, fun=함수명)
##########################################
aggregate(iris[,1:4], by=list(iris$Species), FUN=mean)
aggregate(iris[,1:4], by=list(품종=iris$Species), FUN=mean)
aggregate(iris[,1:4], by=list(품종=iris$Species), FUN=sum)
aggregate(iris[,1:4], by=list(품종=iris$Species), FUN=sd)
aggregate(iris[,1:4], by=list(품종=iris$Species), FUN=max)
aggregate(iris[,1:4], by=list(품종=iris$Species), FUN=min)

aggregate(mtcars,by=list(cyl=mtcars$cyl), FUN=mean)
aggregate(mtcars,by=list(cyl=mtcars$cyl, vs=mtcars$vs), FUN=mean())

#문제 7
#1 Ionosphere 데이터셋을 myds에 저장하시오.
install.packages('mlbench')
library(mlbench)
data("Ionosphere")
myds <- Ionosphere
myds
#2 myds에서 class와 v1열의 값을 그룹으로 하여 v3~v10열의 값들의 표준편차를 출력하시오
head(myds)
aggregate(myds[,3:10], by=list(v1=myds$v1,class=myds$Class), FUN=sd)


#######################################
## 병합 - merge(데이터셋1, 데이터셋2,
##              all=T (외부조인) 또는 all.x=T (오른쪽 외부조인)
##########################################
x <- data.frame(name=c('a','b','c'), math=c(90,80,40))
x
y <- data.frame(name=c('a','b','d'),korean=c(75,60,90))
y
z <- merge(x,y,by=c('name')) # 2개의 공통인 열만 머지됨 (inner join 내부조인)
z
z1 <- merge(x,y,by=c('name'),all=T) # 2개의 모든 데이터값을 조인. 없으면 NA값이 된다.
z1
Z2 <- merge(x,y,by=c('name'),all.x=T) # 왼쪽에 있는 x의 데이터셋 모두 조인
z3 <-  merge( x, y, by=c('name'), all.y = T) # 오른쪽에 있는 y의 데이터셋은 모두 조인되고 왼쪽은 안됨 (right outter join)
z3

#문제14
#1 
subway <- read.csv('D:/ai/study_temp/r/subway.csv',header = TRUE, fileEncoding = "CP949", encoding = "UTF-8")
subway.latlong <- read.csv('D:/ai/study_temp/r/subway_latlong.csv',header = TRUE, fileEncoding = "CP949", encoding = "UTF-8")
subway
subway.latlong

subway.tot <- merge(subway,subway.latlong,by.x = c('station'),by.y = c('STATION_CD'),)
head(subway.tot)
head(subway)
head(subway.latlong)
#2
agg <- aggregate(subway.tot[,c('on_tot','off_tot')], by=list(역이름=subway.tot$stat_name, 날짜=subway.tot$income_date),FUN=sum)
head(agg)
tail(agg)
#3
#(1) 2022년도만 추출
condi <- subway.tot$income_date >= 20110101 & subway.tot$income_date <= 20111231
#(2) 집계 합수
condi <- aggregate(subway.tot[year.2011,c('on_tot','off_tot','income_date')], by=list(역이름=subway.tot$stat_name, 날짜=subway.tot$income_date),FUN=sum)

#4 subway.tot에서 2011년도에 대해서 LINE_NUM(호선)별 on_tot(탑승 인원)과 off_tot(하차 인원)을 집계(합계)하여 출력하시오.
aggregate( subway.tot[ condi, c('on_tot', 'off_tot') ],by=list(호선별=subway.tot$LINE_NUM[condi]),FUN=sum)

#문제15
#1 authors와 books를 생성하고 authors와 books의 내용을 출력
authors <- data.frame(surname = c("Twein", "Venables", "Tierney", "Ripley", "McNeil"),
                      nationality = c("US", "Australia", "US", "UK", "Australia"),
                      retired = c("yes", rep("no", 4)))
books <- data.frame(name = c("Johns", "Venables", "Tierney", "Ripley", "Ripley", "McNeil"),
                    title = c("Exploratory Data Analysis","Modern Applied Statistics ...","LISP-STAT","Spatial Statistics", "Stochastic Simulation","Interactive Data Analysis"),other.author = c(NA, "Ripley", NA, NA, NA, NA))
#2 surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하시오(두 데이터프레임에서 공통 열의 값이 일치하는 것들만 병합).
merge(authors,books, by.x=c('surname'), by.y = c('name'))
#3 surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하되 authors의 행들이 모두 표시되도록 하시오.

#4 surname과 name을 공통 열로 하여 authors와 books를 병합하여 출력하되 books의 행들은 모두 표시되도록 하시오.
 
#5 surname과 other.author를 공통 열로 하여 authors와 books를 병합하여 출력하시오.








