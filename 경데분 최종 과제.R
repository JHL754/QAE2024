library(RSelenium)
library(XML)
library(rvest)
library(stringr)
library(knitr)
library(dplyr)
library(tidyr)
library(lubridate)
library(httr)
library(readxl)
library(writexl)
library(jsonlite)
library(kableExtra)
library(DT)


rD <- rsDriver(browser="firefox", port=4764L, chromever=NULL)
remDr <- rD$client

# 네이버 항공권 웹사이트 접속
remDr$navigate("https://flight.naver.com/flights/")

# 목적지 드롭다운 메뉴 클릭
remDr$findElement(using = "css selector", value = ".select_name__XucEi")->destination_dropdown
destination_dropdown$clickElement()

# "일본" 선택
japan <- remDr$findElement(using = "xpath", value = "//*[@id="__next"]/div/main/div[10]/div[2]/section/section/button[2]]")
japan$clickElement()

# "후쿠오카" 선택
remDr$findElement(using = "css selector", value = ".layer_content ul li a[data-code='FUK']")->fukuoka
fukuoka$clickElement()
