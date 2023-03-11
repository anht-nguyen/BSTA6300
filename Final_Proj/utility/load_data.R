data = read.table("./Data_WeightLoss_Study.txt", sep = "\t", header=T)

data$Race <- factor(data$race, levels = c(1,2,3,4), labels = c("Asian", "African American (non-Hispanic black)", "Hispanic/Latino", "Non-Hispanic white"))

data$Gender <- factor(data$gender, levels = c(0,1), labels = c("Male", "Female"))

data$Marital <- factor(data$married, levels = c(0,1), labels = c("Not married", "Married") )

data$Tobacco <- factor(data$smoker, levels = c(0,1), labels = c("No", "Yes"))

data$Alcohol <- factor(data$drinker, levels = c(0,1), labels = c("No", "Yes"))

data$Education <- factor(data$education, levels = c(0,1), labels = c("<= 12 years", "> 12 years"))

data$Condition <- factor(data$tx, levels=c(0,1), labels = c("Control", "Intervention"))

data$Site <- factor(data$site, levels = c(1,2,3,4,5), labels = c("Site 1", "Site 2", "Site 3", "Site 4", "Site 5"))

data$wgt_change <- data$wgt_final - data$wgt_base


label(data$PID) <- "Participant ID"
label(data$Site) <- "Clinical site"
label(data$wgt_base) <- "Baseline weight"
label(data$wgt_final) <- "Final weight"
label(data$wgt_change) <- "Weight change after intervention"
label(data$month) <- "Time since randomization to final weight"

label(data$height) <- "Height"
label(data$Condition) <- "Intervention condition"
label(data$tx) <- "Intervention condition"
label(data$age) <-"Age"
label(data$Gender) <- "Gender"
label(data$Race) <- "Race/ethnicity"

label(data$comorbid) <- "Number of obesity-related comorbid conditions"
label(data$Education) <- "Education"
label(data$Marital) <- "Marital status"
label(data$Tobacco) <- "Current tobacco use"
label(data$Alcohol) <- "Current alcohol use"

units(data$wgt_base) <- "kg"
units(data$wgt_final) <- "kg"
units(data$wgt_change) <- "kg"
units(data$month) <- "months"
units(data$height) <- "cm"
units(data$age) <- "years"

# filter out missing values
included.data <- data %>% filter(!is.na(wgt_final))

# library(tibble)
included.data <- included.data %>% add_column(Losing_Wgt_Status = if_else(.$wgt_change < 0, "Losing Weight", "Not Losing Weight"))
included.data <- included.data %>% add_column(Losing_Wgt = if_else(.$wgt_change < 0, 1, 0))
