# 1a
before <- c(78, 75, 67, 77, 70, 72, 28, 74, 77)
after <- c(100, 95, 70, 90, 90, 90, 89, 90, 100)

sd_before <- sd(before)
sd_before

sd_after <- sd(after)
sd_after

# 1b
t.test(before, after, alternative = "greater", var.equal = FALSE)

# 1c
var.test(before, after)
t.test(before, after, mu = 0, alternative = "two.sided", var.equal = TRUE)