getwd()

#Let's read in the data
jobs <- read.csv("jobs.csv", header = TRUE, colClasses = c("factor",rep("character",4)))
certs <- read.csv("Certs.csv", header = TRUE, stringsAsFactors = F)

#I want to simplofy this column name
certs$name <- certs$Assignment.Name

#Let's look at the data.
sort(table(certs$name), decreasing = TRUE)
# 
source("~/DocumentsNoCloud/repos/cmcode/Rsandbox/scripts/datamanip/startupfunctions.R")


mycerts <- c("Net II (7 Week) 5.0 MTA OS Fundamentals - Certification Exam","Net II (5 Week) 5.0 MTA OS Fundamentals - Certification Exam","Server I MTA OS FundCert Exam","Client I (7 Week) 3.0 Client I - Certification Exam - MTA OS Fundamentals","Client I (5 Week) 3.0 Client I - MTA OS Fundamentals Certification Exam","Net II (5 Week) 4.0 Certification Exam - MTA OS Fund","Server I MTA OS FundCert Exam")

mycerts[2]
grepl("MTAOS",mycerts)

summary(certs$name)

#We need to take each of the certs and clean up this data a little bit.
certs$serverPlus <- 0
certs$mobilityplus <- 0
certs$netplus <- 0
certs$mtaos <- 0
certs$mtanet <- 0
certs$mtasec <- 0
certs$mtaserv <- 0
certs$aplus <- 0
certs$windows <- 0
certs$ccent <- 0
certs$secplus <- 0
certs$ceh <- 0
certs$ccna <- 0

#fill the columns with the right data.
# MTA Operating System
certs$mtaos[certs$Assignment.Name=="Net II (7 Week) 5.0 MTA OS Fundamentals - Certification Exam"] <- 1
certs$mtaos[certs$Assignment.Name=="Net II (5 Week) 5.0 MTA OS Fundamentals - Certification Exam"] <-1
certs$mtaos[certs$Assignment.Name=="Server I MTA OS FundCert Exam"] <- 1
certs$mtaos[certs$Assignment.Name=="Client I (7 Week) 3.0 Client I - Certification Exam - MTA OS Fundamentals"] <-1
certs$mtaos[certs$Assignment.Name=="Client I (5 Week) 3.0 Client I - MTA OS Fundamentals Certification Exam"] <- 1
certs$mtaos[certs$Assignment.Name=="Net II (5 Week) 4.0 Certification Exam - MTA OS Fund"] <- 1
certs$mtaos[certs$Assignment.Name=="Server I MTA OS FundCert Exam"] <- 1
# MTA Networking
certs$mtanet[certs$Assignment.Name=="Networking I (7 Week) Networking I Certification Exam MTA Networking"] <- 1
certs$mtanet[certs$Assignment.Name=="Networking I (5 Week) Certification Exam MTA Networking "] <-1
certs$mtanet[certs$Assignment.Name=="IDL Networking I (7 Week) Certification Exam MTA Networking"] <-1
# MTA Security
certs$mtasec[certs$Assignment.Name=="N&S I (7 Week) 3.0 MTA Security Fundamentals Cert Exam"]<-1
certs$mtasec[certs$Assignment.Name=="N&S I (5 Week) 4.1 MTA Security Fundamentals - Certification Exam"] <-1
certs$mtasec[certs$Assignment.Name=="N&S I (7 Week) v4.1 MTA Security Fundamentals - Certification Exam"] <- 1
certs$mtasec[certs$Assignment.Name=="N&S I (5 Week) 3.0 MTA Security Fundamentals Certification Exam "] <- 1
certs$mtasec[certs$Assignment.Name=="N&S I (7 Week) 4.0 MTA Security Fundamentals - Certification Exam "] <- 1
certs$mtasec[certs$Assignment.Name=="N&S I (7 Week) 4.1 MTA Security Fundamentals - Certification Exam"] <- 1
certs$mtasec[certs$Assignment.Name=="Networking and Security I MTA Security Fundamentals Certification Exam"] <- 1
# A Plus
certs$aplus[certs$Assignment.Name=="Computer Essentials (7 Week) 2.0 220-901 Certification Exam"] <-.5
certs$aplus[certs$Assignment.Name=="Computer Essentials (7 Week) 2.0 220-902 Certification Exam"] <-.5
certs$aplus[certs$Assignment.Name=="Computer Essentials (5 Week) 2.0 220-901 Certification Exam"] <-.5
certs$aplus[certs$Assignment.Name=="Computer Essentials (5 Week) 2.0 220-902 Certification Exam"] <-.5
certs$aplus[certs$Assignment.Name=="IDL Computer Essentials (7 Week) 220-901 Certification Exam"] <-.5
certs$aplus[certs$Assignment.Name=="IDL Computer Essentials (7 Week) 220-902 Certification Exam"] <-.5
#Server Plus
certs$serverPlus[certs$Assignment.Name=="Server I (5 Week) 4.0 Server I Certification Exam - Server+"] <-1
certs$serverPlus[certs$Assignment.Name=="Server I Server+ Certification Exam"] <- 1
certs$serverPlus[certs$Assignment.Name=="Server I (7 Week) 4.0 * Server I Certification Exam - Server+"] <- 1
certs$serverPlus[certs$Assignment.Name=="Refresher Server I Server I Certification Exam - Server+"] <- 1
certs$serverPlus[certs$Assignment.Name=="Server I Server+ Certification Exam"] <- 1
#Security Plus
certs$secplus[certs$Assignment.Name=="Networking & Security V N&S V - Certification Exam - Security+"] <- 1
#Net Plus
certs$netplus[certs$Assignment.Name=="Networking I (5 Week) Certification Exam Network+"] <- 1
certs$netplus[certs$Assignment.Name=="Networking I (7 Week) Networking I Certification Exam Network+"] <- 1
certs$netplus[certs$Assignment.Name=="IDL Networking I (7 Week) Networking I Certification Exam Network+"] <- 1
certs$netplus[certs$Assignment.Name=="Refresher Networking I Networking I Network+ Certification Exam"] <- 1
#Windows 7
certs$windows[certs$Assignment.Name=="Client I (5 Week) 4.0 Windows 7 Client - Certification Exam"] <- 1
certs$windows[certs$Assignment.Name=="Client I (7 Week) 3.0 Client I - Certification Exam - Windows 7 Configuration"] <- 1
certs$windows[certs$Assignment.Name=="Client I (5 Week) 3.0 Client I - Windows 7 Configuration Certification Exam"] <- 1
certs$windows[certs$Assignment.Name=="Client I (7 Week) 4.0 Windows 7 Client - Certification Exam"] <- 1
certs$windows[certs$Assignment.Name=="Client I (7 Week) v4.1 Windows 7 Client - Certification Exam"] <- 1
certs$windows[certs$Assignment.Name=="Client I (5 Week) 4.0 MTA OS Windows 7 Client - Certification Exam"] <- 1
certs$windows[certs$Assignment.Name=="Client I (5 Week) 4.0 Windows 7 Client - MTA OS Certification Exam"] <- 1
certs$windows[certs$Assignment.Name=="Client I (5 Week) MTA OS 4.0 Windows 7 Client - Certification Exam"] <- 1
certs$windows[certs$Assignment.Name=="Client I Windows 7 Configuration Certification Exam"] <- 1
certs$windows[certs$Assignment.Name=="Client I (7 Week) 4.1 Windows 7 Client - Certification Exam"] <- 1
#Mobility Plus
certs$mobilityplus[certs$Assignment.Name=="Net II (7 Week) 4.0 Certification Exam - Mobility+"] <- 1
certs$mobilityplus[certs$Assignment.Name=="Net II (5 Week) 4.0 Certification Exam - Mobility+"] <- 1
certs$mobilityplus[certs$Assignment.Name=="Networking II (7 Week) 4.0 Certification Exam - Mobility+"] <- 1
certs$mobilityplus[certs$Assignment.Name=="Refresher Mobility+ Course Mobility+ Certification Exam"] <- 1
certs$mobilityplus[certs$Assignment.Name=="IDL Networking II (7 Week) Certification Exam - Mobility+"] <- 1
certs$mobilityplus[certs$Assignment.Name=="IDL Networking II (7 Week) Certification Exam - Mobility+"] <- 1
#CCENT
certs$ccent[certs$Assignment.Name=="N&S I (7 Week) 3.0 CCENT Certification Exam"] <- 1
certs$ccent[certs$Assignment.Name=="N&S I (5 Week) 4.1 CCENT - Certification Exam"] <- 1
certs$ccent[certs$Assignment.Name=="N&S I (7 Week) 4.0 CCENT - Certification Exam"] <- 1
certs$ccent[certs$Assignment.Name=="N&S I (7 Week) v4.1 CCENT - Certification Exam"] <- 1
certs$ccent[certs$Assignment.Name=="N&S I (7 Week) 4.1 CCENT - Certification Exam"] <- 1
#CEH
certs$ceh[certs$Assignment.Name=="Networking & Security IV N&S IV - Certification Exam - CEH"] <- 1


#------------------------------

newdata <- merge(jobs,certs,by="Student.Program.Name",all.x=TRUE)
.libPaths(c("C:\\users\\kenj\\Documents\\R\\R-3.3.3\\library",.libPaths()))

library(dplyr)

trytwo <- newdata %>% group_by(Student.Program.Name) %>% 
  summarise(countrows = n(),
            countstudents = length(unique(studentname)),
            totalmoney = sum(money,na.rm=T)) %>% 
  ungroup() %>% 
  arrange(desc(totalmoney)) %>% 
  as.data.frame()

