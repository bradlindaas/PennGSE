
library(relaimpo)

fit <- lm(NPV~Teach+Signup+Signup_CAGR+Ret+Buy_Class+Buy_Class_CAGR+Class_Price+Course_Cost+Users_Per_Mod+Users_Per_Mod_CAGR+Mod_Cost+Seat_Class+Seat_Class_CAGR+Class_Per_Inst+Misc, data=MT)
boot <- boot.relimp(fit, b = 1000, type = c("first"), rank = TRUE,  diff = TRUE, rela = TRUE)
booteval.relimp(boot) # print result
plot(booteval.relimp(boot,sort=TRUE)) # plot result


# Pie Chart with Percentages
slices <- colMeans(MT)[27:35] 
lbls <- substring(names(slices),3)
pct <- round(slices/sum(slices)*100)
lbls <- paste(lbls, pct) # add percents to labels 
lbls <- paste(lbls,"%",sep="") # ad % to labels 
pie(slices,labels = lbls, col=rainbow(length(lbls)),
    main="Sources of Expense When the Venture is Running a Loss")
substring(x, 2)