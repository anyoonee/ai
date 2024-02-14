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