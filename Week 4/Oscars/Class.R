# Reading the file: 
oscars <- read.csv("oscars.csv")
str(oscars)
oscars[1:20,]

# CH - 2 is LOSER, 1 is WINNER
# Pic-AFL: see if there are any correlations between the data points
# Column with G's are GOLDEN GLOBE AWARDS (Drama, music/ comedy), GD- Director, GML - Male lead (either in drama or music/comedy)

oscars$Ch <- 2 - oscars$Ch
oscars[1:20, ]

tapply(oscars$Nom[oscars$PP==1], oscars$Ch[oscars$PP==1], mean)
tapply(oscars$Nom[oscars$PP==1], oscars$Ch[oscars$PP==1], var)
# Two sided t-test
# t.test(oscars$Nom[oscars$PP==1&oscars$Ch==1], oscars$Ch[oscars$PP==1&oscars$Ch==0])

# One sided t-test
t.test(oscars$Nom[oscars$PP==1&oscars$Ch==1], oscars$Ch[oscars$PP==1&oscars$Ch==0], alternative = c("greater"))

table(oscars$Dir[oscars$PP==1&oscars$Ch==1])
# So, one movie did not get director nomination and won the award. Wow. ok.
which(oscars$Dir==0&oscars$PP==1&oscars$Ch==1)
# Lets see which movie it is
oscars[362,]
table(oscars$Dir[oscars$PP==1&oscars$Ch==0])

# So, lets see if there is a co-relation between best actor and best picture award. 
table(oscars$Pic[oscars$MM==1&oscars$Ch==1])

# Lets see the same for females
table(oscars$Pic[oscars$FF==1&oscars$Ch==1])

# Some interesting observations
oscars$Year[oscars$FF==1 & oscars$Ch==1]
subset(oscars, Year==1968&FF==1)

# So, we have a lot of nomination data that we have looked at
# Let's take a look at pre-oscar winning award!

# Note: these are awards given, not nominations!
oscars$G  <- oscars$Gdr + oscars$Gmc

table(oscars$G[oscars$PP==1&oscars$Ch==1])
table(oscars$Gd[oscars$DD==1&oscars$Ch==1])

# We can also look at awards and nominations and previous years
# PrNl - Previous nominations
# PrWl - Previous won nominations

table(oscars$PrNl[oscars$MM==1], oscars$Ch[oscars$MM==1])
table(oscars$PrWl[oscars$MM==1], oscars$Ch[oscars$MM==1])


#For logit models, need to use libarart

install.packages("mlogit")
library(mlogit)


oscarsPP <- subset(oscars, PP==1)

# Predictors that we will have: 
# 1. Nominations
# 2. Director was nominated for oscar
# 3. Picture won a golden globe
# 4. Male lead actor was nominated
# 5. Female lead actress was nominated
# 6. Producer's Guild Award
# 7. How long the movie is 
# 8. Length of days?
?mlogit.data
D <- mlogit.data(subset(oscarsPP, Year <= 2006), choice = "Ch", shape = 'long', alt.var = 'Mode')
M <- mlogit(Ch~Nom+Dir+G+Aml+Afl+PGA+Length+Days-1, data=D)
summary(M)

#End of the day. Will continue next class!