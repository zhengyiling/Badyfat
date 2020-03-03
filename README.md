# Badyfat
A good measure of fitness levels.

# Introduction
Being fit is popular in west countries. Healthy eating and regular exercise are widely promoted. But how can we know if we are fit or not? Only considering the weight is not a good choice. Here comes "the body fat percentage", which is a great measure of individual fitness levels. In this project, I will analyze the date from 252 men, which contains their underwater weighing and various body circumference measurement to discover the relationship between those circumference and the body fat. I found the dataset from the website called StatLib. (http://lib.stat.cmu.edu/datasets/bodyfat ) 

# Background
Hydrostatic weighing, also referred to as “underwater weighing”, is a technique for measuring the mass per unit volume of a living person’s body, based on Archimedes’ principle. Once we get the underwater weighing, we can use the equation below to estimate the body density. 

(Db=density of the body, Ma=dry weight, Mw=underwater weight, Dw=density of the water, RV=residual volume). 

when we get the body density, there are two most commonly used equations for estimating the percentage of fat in the body.

Siri (1956): fat%=[4.950/density-4.500]*100

Brozek et al. (1963): fat%=[4.570/density-4.142]*100

In this data, there are 15 variables and 252 observations, variables are density determined from underwater weighing, percent body fat from Siri’s (1956) equation, age(years), weight(lbs), height(inches), neck circumference(cm), chest circumference(cm), abdomen 2 circumference(cm), hip circumference(cm), thigh circumference(cm), knee circumference(cm), ankle circumference(cm), biceps(extended) circumference(cm), forearm circumference(cm), wrist circumference(cm).
To do LDA and Logit analysis, I create two new variables: group and class, they are created by different age interval, there are three kinds of group (A, B and C) and two kinds of class (0 and 1). Group A range from 22-years-old to 35.75-years-old; Group B range from 35.75-years-old to 54-years-old; Group C range from 54-years-old to 81-years-old. Whose age lower than 44.88 belongs to the class 0, then over 44.88 belongs to the class 1.

# Method
Cluster; K-means; GG-plot; Linear Discrimination; Multiple Linear Regression; Logit.
