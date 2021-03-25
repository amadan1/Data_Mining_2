p.Banana = 500/1000
p.Orange = 300/1000
p.Other = 200/1000

p.Long = 500/1000
p.Sweet = 650/1000
p.Yellow = 800/1000

p.LongBanana = 400/500
p.SweetBanana = 350/500
p.YellowBanana = 450/500

tp.Banana = p.LongBanana*p.SweetBanana*p.YellowBanana

p.LongOrange = 0/300
p.SweetOrange = 150/300
p.YellowOrange = 300/300

tp.Orange = p.LongOrange*p.SweetOrange*p.YellowOrange

p.LongOther = 100/200
p.SweetOther = 150/200
p.YellowOther = 50/200

tp.Other = p.LongOther*p.SweetOther*p.YellowOther

d=(p.Long*p.Sweet*p.Yellow)
pBanana.LongSweetYellow = (p.LongBanana*p.SweetBanana*p.YellowBanana*p.Banana)/d
pOrange.LongSweetYellow = (p.LongOrange*p.SweetOrange*p.YellowOrange*p.Orange)/d
pOther.LongSweetYellow = (p.LongOther*p.SweetOther*p.YellowOther*p.Other)/d

f<-c('Banana','Orange','Other')
p<-c(pBanana.LongSweetYellow,pOrange.LongSweetYellow,pOther.LongSweetYellow)
df<-data.frame("Fruit"=f,"Probability of Being Long, Sweet, and Yellow"=p)
df
## Ashrith Madan