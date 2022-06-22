install.packages("twitteR")
install.packages("ROAuth")
install.packages("tm")
install.packages("RCurl")
install.packages("tidyverse")
install.packages("ggplot2")
library(ggplot2)
library(twitteR)
library(ROAuth)
library(tm)
library(RCurl)
library(tidyverse)
library(lubridate)#histogramda saatr analizi yapmak için kullanıcaz
options(RCurlOptions = list(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl")))


#TWEETTER DAN ELDE EDILMIS APİ KEY
api_key <- "pbpfKkwzsepPzVkCcCnps8v3h"
api_secret <- "GWmkj9BK4AP6ByCEjjJAjcAq1OruLHHYIrpZtv7BL1gvsxZD98"
access_token <- "1508868869435363341-R4TR7srau5QdNkSz65HASPiiTxpNox"
access_token_secret <- "hSwNfjmvnLwnylPD33bCmuLlvjXXyCQCSYSjhZ6c23yuj"


# registerTwitterOAuth(twitCred)
setup_twitter_oauth(api_key, api_secret, access_token, access_token_secret)
availableTrendLocations() %>% filter(country=="Turkey")

  t<- getTrends(23424969) # türkiye kodundaki trendleri gösterir
head(t,9) # ilk 9 başlığı gösterir
x <- userTimeline("elonmusk", n=10) #elon muskin tweetlerini gösterir. ek olarak ilk 10 tweet
x<- twListToDF(x)
View(x)

tw<-searchTwitter("#doğalgaz",n=2000) #oluşan etiketi ilk 20000 tweetr ile sınırlayıp gösterdik
class(tw)
str(tw)

df_tw <- twListToDF(tw) #liste halinde olan değişkeni df içinde gösterme veya df çevirme kodu
View(df_tw) #df kodunu gösteren komut
 
df_tw$favoriteCount
df_tw$text
df_tw$favorited

saat <- hour(df_tw$created) #saat değişkenine tw dfini oluşturduk ve  saatlerini inceledik 
hist( saat, col ="red",    xlab ="saat aralığı" ,    ylab ="tweet aralığı")  #olşturduğumuz saat ddeğişkenini  histogram ile gösterdik

        ##GALATASARIN ATTIĞI TWEETLERİ İNCELEME

g<-userTimeline("GalatasaraySK")
df_g<-twListToDF(g)
wday(df_g$created)
wday(df_g$created, label = T)     #galatasarın attığı tweetleirn günleri türkçe olarak
gun <- wday(df_g$created, label = T)

kaynaklar <- df_g$statusSource#atılan tweetlerin hangi platformadn atıldığını gösterir.
print(kaynaklar)
  #kaynaklardaki kodları nereden atıldığını gösteren kodların bölümü
kaynaklar1 <- gsub("</a>","" , kaynaklar)# kaynaklar içerisindeki seöilen karakteri siler
help(gsub)
print(kaynaklar1)
kaynaklar2 <- strsplit(kaynaklar1,">") # büyüktür işaretinden beri gelen kelşmeleri böler
print(kaynaklar2)
kaynaklar3 <- sapply(kaynaklar2 , function(u)  u[2] )
print(kaynaklar3)
 #    son hali ile birlikte
kaynaklar_tablosu <- table(kaynaklar3)
pie(kaynaklar_tablosu) #kaynaklar tablosunu pasta dilimi şeklinde gösterir.



l <- ggplot2(df,aes(gun) + geom_bar()) #hatalı kod ama bar şeklinde hsitogram gibi gösterir.


trend<- getTrends(2344174)
head(trend,10)    

df1 <- searchTwitter("bartın", n=50)
df1                                     

ıv <- userTimeline("IvankaTrump", n=10)

df_ıv <- twListToDF(ıv)
ıv$

  
  ıv<-getUser("IvankaTrump")
ıv$lastStatus$retweeted

df_user<-userTimeline("IvankaTrump ", n=2)
df<-twListToDF(df_user)
df

ıv<-getUser("IvankaTrump")




#en son atılan 5

df_user<-userTimeline("IvankaTrump",n=1)
df<-twListToDF(df_user)
kaynak<- df$statusSource

kaynak2<- gsub("</a>","", kaynak)
kaynak3<- strsplit(kaynak2,">")
sapply(kaynak3,function(x) x[2])

ıv<-getUser("IvankaTrump")
ıv$id
ıv<-getUser("IvankaTrump")
ıv$created




ıv<-getUser("IvankaTrump")
ıv$created


ıv<-getUser("IvankaTrump")
ıv$location



ıv<-getUser("IvankaTrump")
ıv$followersCount


ıv<-getUser("IvankaTrump")
ıv$favoritesCount

ıv<-getUser("IvankaTrump")
ıv$friendsCount



ıv<-getUser("IvankaTrump")
ıv$description



availableTrendLocations() %>% filter(country=="Turkey")

trend<- getTrends(2343999)
head(trend,10) 





df_user<-userTimeline("IvankaTrump ", n=2)
df<-twListToDF(df_user)
df


