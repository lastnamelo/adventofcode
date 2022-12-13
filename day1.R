PuzzleInput <- read.csv(file = "puzzleinput1.csv", blank.lines.skip = FALSE)
Elf <- 1
Calories <- 0
Totals <- data.frame()

#Part 1
for (i in 1:nrow(PuzzleInput)) {
  if (is.na(PuzzleInput[i,])) {
    Totals <- rbind(Totals, c(Elf,Calories))
    Elf <- Elf + 1
    Calories <- 0
  } else {
    Calories <- Calories + PuzzleInput[i,]
  }
}
colnames(Totals) <- c("Elf","Calories")

#Find the Elf carrying the most Calories. How many total Calories is that Elf carrying?
Part1Ans <- paste("Elf", which.max(Totals$Calories), "is carrying", max(Totals$Calories), "calories")

#Part 2
Totals <-Totals[order(Totals$Calories, decreasing = TRUE),]

#Find the top three Elves carrying the most Calories. How many Calories are those Elves carrying in total?
Part2Ans <- sum(Totals$Calories[1:3])

#Answer
paste("Part 1:", Part1Ans)
paste("Part 2:", Part2Ans)
