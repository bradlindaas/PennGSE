setwd('/home/rstudio/PennGSE/')
fname <- "MoneyThingy-August-Branch-2.csv"
MT <- read.csv(fname, header = TRUE)

library(relaimpo)

fit <- lm(BE~Teach+Signup+Signup_CAGR+Ret+Buy_Class+Buy_Class_CAGR+Class_Price+Course_Cost+Users_Per_Mod+Users_Per_Mod_CAGR+Mod_Cost+Seat_Class+Seat_Class_CAGR+Class_Per_Inst+Misc, data=MT)
boot <- boot.relimp(fit, b = 1000, type = c("first"), rank = TRUE,  diff = TRUE, rela = TRUE)
booteval.relimp(boot) # print result
plot(booteval.relimp(boot,sort=TRUE)) # plot result

