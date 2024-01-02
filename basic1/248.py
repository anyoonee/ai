#248 6-1
year_sale={"2016":237,"2017":98,"2018":158,"2019":233,"2020":120}

sm = 0
big_year =2016
biggest = year_sale["2016"]

for key in year_sale:
  if key=="2017":
    print("%s년 자동차 판매량 : %d대" %(key,year_sale[key]))
    print()

#6-2
for key in year_sale:
  if key=="2018" or key=="2019" :
    print("%s년 자동차 판매량 : %d"%(key,year_sale[key]))
    sm = sm+year_sale[key]

print("2년간 자동차 판매량 : %d대"%sm)
print()

#6-3
for key in year_sale:
  sm = sm+year_sale[key]

avg = sm/len(year_sale)

print("5년간 총 판매량 : %d"%sm)
print("5년간 연 평균 판매량 : %d" %avg)
print()

#6-4

for key in year_sale:
  if year_sale[key] > biggest  :
    big_year =key
    biggest = year_sale[key]

print("판매량이 가장 많은 해: %s 년"%big_year)
print("판매량 : %d대"%biggest)

#251 6-1
temp={"월":15.5, "화":17.0,"수":16.2, "목":12.9, "금":11.0, "토":10.5, "일":13.3}
min=-999
minkey = "월"
sum=0

print("-"*30)
for key in temp:
  print("%s"%key,end=" ")
print()
print("-"*30)
for key in temp:
  print("%.1f"%temp[key],end=" ")
print()
print("-"*30)

#6-2
for key in temp:
  if min < temp[key] :
    min = temp[key]
    minkey = key
print("요일:%s,최저기온:%.1f"%(minkey,min))
print()

#6-3
for key in temp:
  sum = sum +temp[key]
avg = sum/len(temp)
print("일주일간 기온 평균:%.1f"%avg)
