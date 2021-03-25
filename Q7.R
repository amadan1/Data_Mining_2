# 'Color'
p.Grey = 2/5
p.Yellow = 2/5
p.Brown = 1/5

Grey.Elephant = 2/2
Grey.Giraffe = 0/2
Grey.Monkey = 0/2
Grey.Tiger = 0/2
Gini.Grey = 1-(Grey.Elephant^2 + Grey.Giraffe^2 + Grey.Monkey^2 + Grey.Tiger^2)

Yellow.Elephant = 0/2
Yellow.Giraffe = 1/2
Yellow.Monkey = 0/2
Yellow.Tiger = 1/2
Gini.Yellow = 1-(Yellow.Elephant^2 + Yellow.Giraffe^2 + Yellow.Monkey^2 + Yellow.Tiger^2)

Brown.Elephant = 0/1
Brown.Giraffe = 0/1
Brown.Monkey = 1/1
Brown.Tiger = 0/1
Gini.Brown = 1-(Brown.Elephant^2 + Brown.Giraffe^2 + Brown.Monkey^2 + Brown.Tiger^2)

WGI.C = (p.Grey*Gini.Grey)+(p.Yellow*Gini.Yellow)+(p.Brown*Gini.Brown)

# 'Height'
p.Height10 = 3/5
p.Height4 = 1/5
p.Height3 = 1/5

Height10.Elephant = 2/3
Height10.Giraffe = 1/3
Height10.Monkey = 0/3
Height10.Tiger = 0/3
Gini.Height10 = 1-(Height10.Elephant^2 + Height10.Giraffe^2 + Height10.Monkey^2 + Height10.Tiger^2)

Height4.Elephant = 0/1
Height4.Giraffe = 0/1
Height4.Monkey = 0/1
Height4.Tiger = 1/1
Gini.Height4 = 1-(Height4.Elephant^2 + Height4.Giraffe^2 + Height4.Monkey^2 + Height4.Tiger^2)

Height3.Elephant = 0/1
Height3.Giraffe = 0/1
Height3.Monkey = 1/1
Height3.Tiger = 0/1
Gini.Height3 = 1-(Height3.Elephant^2 + Height3.Giraffe^2 + Height3.Monkey^2 + Height3.Tiger^2)

WGI.h = (p.Height10*Gini.Height10)+(p.Height4*Gini.Height4)+(p.Height3*Gini.Height3)

# Comparison and Results
af <- c('Color','Height')
gi <- c(WGI.C,WGI.h)
df<-data.frame("Features"=af,"Gini Index"=gi)
df
## Ashrith Madan