######################################
# Coding Political Knowledge, CCES  #
# Author: Erik de Vries             #       
# Last Modified: 23/03/2015         #
######################################

x <- read.dta("cces_common_cumulative_4.dta")
x <- subset(x,year==2006|year==2010)
## Merge knowledge 2006,2007 measure with 2010 measure of Rep Party
x$knows_repparty <- as.character(x$knowledge_rep_party_name)
x$knows_repparty[which(x$year==2006|x$year==2007)]= as.character(x$knowledge_rep_party_06_07)[which(x$year==2006|x$year==2007)]
# Knowledge Measure Rep Party 
x$knows_reppartyname <- as.character(x$knows_repparty)==as.character(x$house_inc_party)

## Merge knowledge 2006,2007 measure with 2010 measure of Senate Party 1
x$knows_senparty1 <- as.character(x$knowledge_sen1_party_name)
x$knows_senparty1[which(x$year==2006|x$year==2007)]=as.character(x$knowledge_sen1_party_06_07)[which(x$year==2006|x$year==2007)]
# Knowledge Measure Senate Measure
x$knows_sen1 <- as.character(x$knows_senparty1)==as.character(x$senator1_party)

## Merge knowledge 2006,2007 measure with 2010 measure of Senate Party 2
x$knows_senparty2 <- as.character(x$knowledge_sen2_party_name)
x$knows_senparty2[which(x$year==2006|x$year==2007)]=as.character(x$knowledge_sen2_party_06_07)[which(x$year==2006|x$year==2007)]
# Knowledge Measure Senate Measure
x$knows_sen2 <- as.character(x$knows_senparty2)==as.character(x$senator2_party)

## Merge knowledge 2006,2007 measure with 2010 measure of Governor Party
x$knows_govparty <- as.character(x$knowledge_governor_party_name)
x$knows_govparty[which(x$year==2006|x$year==2007)]=as.character(x$knowledge_gov_party_06_07)[which(x$year==2006|x$year==2007)]
# Knowledge Measure Governor Measure
x$knows_gov <- as.character(x$knows_govparty)==as.character(x$governor_party)

## Knows house majority (in these studies, it is house majority before the election)
x$knows_hs_majority <- 0
x$knows_hs_majority[x$year==2006 & x$knowledge_house_maj=='Republicans'] = 1
x$knows_hs_majority[x$year==2010 & x$knowledge_house_maj=='Democrats'] = 1

## Placing governor on approval scale (opposed to not sure)
x$knows_approval_gov <- 1
x$knows_approval_gov[x$approval_gov=='Not sure'] = 0

## Placing Democratic party left of Republican party (2010 data)
x$knows_ideo7_party <- 0
x$knows_ideo7_party[as.numeric(x$ideo7_dems)<as.numeric(x$ideo7_gop)] = 1

## Placing Democratic party left of Republican party (2006 data)
x$knows_ideo100_party <- 0
x$knows_ideo100_party[as.numeric(x$ideo100_dems)<as.numeric(x$ideo100_gop)] = 1
    
## Gender recoding
x$gender_fem <- 0
x$gender_fem[x$gender=='Female'] = 1

## Black recode
x$ethn_black <- 0
x$ethn_black[x$race=='Black'] = 1

## Age squared recode
x$age2 <- x$age^2

## (Current) union member recode
x$union_mem <- 0
x$union_mem[x$union=='Yes, I am currently a member of a labor union'] = 1
