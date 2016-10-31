library(tidyverse)
library(cocor)
library(apaTables)
?cocor.dep.groups.nonoverlap

#question 1, is the rating-complaint correlation stronger than the rating-critical cor?
#comparing the 2 correlations he gave us
rating_complaint_cor <- .83
rating_critical_cor <- .16
complaint_critical_cor <- .19
#all the variables have to be included, even tho we only want the first 2

cocor.dep.groups.overlap(rating_complaint_cor, rating_critical_cor, complaint_critical_cor, 30)
#the rating-compliant correlation is significantly stronger than the rating-critical cor
# delta r = .67, 95% CI [.32, 1.0], p = .0001

#question 2, determine if the rating-complaint correlation is stronger than the raises-critical correlation
?cocor.dep.groups.nonoverlap #performs sig test for the difference bw 2 cors in the same group

rating_complaint_cor <- .83
raises_critical_cor <- .38 

rating_raises_cor <- .59
rating_critical_cor <- .16
complaint_raises_cor <- .67
complaint_critical_cor <- .19

cocor.dep.groups.nonoverlap(rating_complaint_cor, raises_critical_cor, rating_raises_cor, rating_critical_cor, complaint_raises_cor, complaint_critical_cor, 30)
#rating-complaint is stronger than raises-critical, delta r = .45, 95% CI [.14, .81], p = .005


#REPLICATION ISSUES
#Question 3: You decide to run a replication of this study. 
#In your replication you want to evaluate the rating-privileges correlation. 
#You plan on using a sample size of N = 100. 
#What is the prediction interval when you use N = 100 for your replication sample size? 
#(Use the predictionInterval package)

install.packages("predictionInterval")
library(predictionInterval)
?predictionInterval
#this makes the PI, super easy
pi.r(.43, 30, rep.n = 100, prob.level = 0.95)
#the PI for our new study is 95% PI[.05, .74]


#QUESTION 4: what replication sample size do you need to ensure the prediction interval width 
#(i.e., upper bound minus lower bound) is not greater than .50?
pi.r(.43, 30, rep.n = 10000, prob.level = 0.95)
pi.r(.43, 30, rep.n = 1000, prob.level = 0.95)
#once it gets to a certain sample size, the PI is the same as the CI for the original study

#QUESTION 5
#You discover a new paper that also examines the rating-privileges correlation. 
#It used a sample size of 1000 and obtained a correlation of .10. 
#Is this correlation different from from the rating-privileges correlation in Table 1 above? 
#Use the cocor package command: cocor.indep.groups

?cocor.indep.groups
cocor.indep.groups(.43, .10, 30, 1000)
#the two correlations are not significantly different, delta r = .33, 95% CI[-.02, .59], p = .06

#QUESTION 6
#What can you conclude about the strength of the 
#rating-privileges correlation based on Table 1 and the result obtainied in Question 5?









