---
title       : Summer Olympics Medal Ranking from 1896 - 2008
subtitle    : Developing Data Products - Course Project - Presentation
author      : Daniel Ielpo
job         : 
framework   : io2012        # {io2012, html5slides, shower, dzslides, ...}
highlighter : highlight.js  # {highlight.js, prettify, highlight}
hitheme     : tomorrow      # 
widgets     : []            # {mathjax, quiz, bootstrap}
mode        : selfcontained # {standalone, draft}
knit        : slidify::knit2slides
logo        : logo.png
---

## Introduction / Motivation

This is my submission for the Coursera Developing Data Products course Project.

In this project I created a dashboard using Shiny to do some exploratory analysis in a Summer Olympics Medal dataset.

As the 2016 Summer Olympics Games are happening in my city, Rio de Janeiro, I searched the web for some datasets to use in this project.

I found an interesting dataset with all medalists from the 1896 - 2008 Summer Olympics, that will be described in the next slide.

So I decide to create a interactive dashboard with this dataset to make a ranking with the countries who won most medals.

--- .class #id 

## The Data Set 

The dataset I used in this project is published at Tableau Public Sample Data Sets.  

There I found an Excel file with all medalists from 1896 to 2008 Summer Olympics. This dataset was published by The Guardian. 

https://public.tableau.com/s/sites/default/files/media/Resources/Summer_Olympic_medallists_1896-2008.xlsx

I used the data contained at the "ALL MEDALISTS" sheet.

To load the data I used readxl library to read the Excel file in the "server.R" file.


```r
library("readxl")
 medalists <- read_excel("../Summer_Olympic_medallists_1896-2008.xlsx", sheet = "ALL MEDALISTS")
```

After that the data is aggregated by Edition, Country, and Medal using plyr library functions. 

Then I count and order the dataset to the country that won more medals to the country that won less medals in the total.

--- .class #id 

## The Shiny app

The dashboard app I build contains 3 inputs (Edition, Event Gender, Top Countries), so you can make an exploratory analysis with the loaded database.

It has 2 outputs, a text output only to show some messages, and a plot output.

The plot output uses ggplot, it has 3 columns with the total Bronze, Silver and Gold Medals.

If there is no data available, for the Edition or gender, then a message is displayed showing that there is no data available.

--- .class #id 

## Conclusion

The app was deployed on shinyappps.io the link is below:

https://danielielpo.shinyapps.io/Developing_Data_Products_Course_Project/

The code for the app and for this presentation is available at my github account.

https://github.com/daniel-ielpo/DDP-Couse_Project

I hope you have enjoyed.

