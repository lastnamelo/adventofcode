PuzzleInput <- read.csv(file = "puzzleinput1.csv", blank.lines.skip = FALSE, as.is = TRUE)
ElfNumber <- 1
Calories <- 0
Totals <- data.frame()

#Part 1

for (i in 1:nrow(PuzzleInput)) {
  if (is.na(PuzzleInput[i,])) {
    Totals <- rbind(Totals, c(ElfNumber,Calories))
    ElfNumber <- ElfNumber + 1
    Calories <- 0
  } else {
    Calories <- Calories + PuzzleInput[i,]
  }
}
colnames(Totals) <- c("Elf","Calories")

print(paste("Elf", which.max(Totals$Calories), "is carrying", max(Totals$Calories), "calories"))

#Part 2
Totals <-Totals[order(Totals$Calories, decreasing = TRUE),]

sum(Totals$Calories[1:3])
