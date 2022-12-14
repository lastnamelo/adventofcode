PuzzleInput <- read.csv(file = "PuzzleInput2.csv", sep = " ", header = FALSE)

colnames(PuzzleInput) <- c("You","Me")

PuzzleInput$You <- as.character(PuzzleInput$You)
PuzzleInput$Me <- as.character(PuzzleInput$Me)

StrategyA <- PuzzleInput

StrategyA$Me[StrategyA$Me == "X"] <- 1
StrategyA$Me[StrategyA$Me == "Y"] <- 2
StrategyA$Me[StrategyA$Me == "Z"] <- 3

for (i in 1:nrow(StrategyA)) {
  if (StrategyA$Me[i]==1) {
    if (StrategyA$You[i]=="A") {
      StrategyA$You[i]<- 3
    } else if (StrategyA$You[i]=="B") {
      StrategyA$You[i]<- 0
    } else{
      StrategyA$You[i]<- 6
    }
  } else if (StrategyA$Me[i]==2) {
    if (StrategyA$You[i]=="A") {
      StrategyA$You[i]<- 6
    } else if (StrategyA$You[i]=="B") {
      StrategyA$You[i]<- 3
    } else{
      StrategyA$You[i]<- 0
    }
  } else{
    if (StrategyA$You[i]=="A") {
      StrategyA$You[i]<- 0
    } else if (StrategyA$You[i]=="B") {
      StrategyA$You[i]<- 6
    } else{
      StrategyA$You[i]<- 3
    }
  }
}

StrategyA$You <- as.numeric(StrategyA$You)
StrategyA$Me <- as.numeric(StrategyA$Me)

#What would your total score be if everything goes exactly according to your strategy guide?
Part1Ans <-sum(StrategyA)

#Part 2
StrategyB <- PuzzleInput

StrategyB$Me[StrategyB$Me == "X"] <- 0
StrategyB$Me[StrategyB$Me == "Y"] <- 3
StrategyB$Me[StrategyB$Me == "Z"] <- 6

for (i in 1:nrow(StrategyB)) {
  if (StrategyB$You[i]=="A") {
    if (StrategyB$Me[i]==0) {
      StrategyB$You[i]<- 3
    } else if (StrategyB$Me[i]==3) {
      StrategyB$You[i]<- 1
    } else{
      StrategyB$You[i]<- 2
    }
  } else if (StrategyB$You[i]=="B") {
    if (StrategyB$Me[i]==0) {
      StrategyB$You[i]<- 1
    } else if (StrategyB$Me[i]==3) {
      StrategyB$You[i]<- 2
    } else{
      StrategyB$You[i]<- 3
    }
  } else{
    if (StrategyB$Me[i]==0) {
      StrategyB$You[i]<- 2
    } else if (StrategyB$Me[i]==3) {
      StrategyB$You[i]<- 3
    } else{
      StrategyB$You[i]<- 1
    }
  }
}
StrategyB$You <- as.numeric(StrategyB$You)
StrategyB$Me <- as.numeric(StrategyB$Me)

#What would your total score be if everything goes exactly according to your strategy guide?
Part2Ans <-sum(StrategyB)


#Answer
paste("Part 1:", Part1Ans)
paste("Part 2:", Part2Ans)

#MORE ELEGANT/EFFICIENT SOLUTION REF: ARDOMINE FOR SWITCH FUNCTION

PuzzleInput <- read.csv(file = "PuzzleInput2.csv", header = FALSE)

StrategyA <- as.matrix(PuzzleInput)

for (i in 1:nrow(StrategyA)) {
  StrategyA[i] <- 
    switch (StrategyA[i],
            'A X' = 1 + 3, 
            'A Y' = 2 + 6, 
            'A Z' = 3 + 0, 
            'B X' = 1 + 0, 
            'B Y' = 2 + 3, 
            'B Z' = 3 + 6,
            'C X' = 1 + 6, 
            'C Y' = 2 + 0, 
            'C Z' = 3 + 3
    )
}

Part1Ans <- sum(as.numeric(StrategyA)) 

#Part 2
StrategyB <- as.matrix(PuzzleInput)

for (i in 1:nrow(StrategyB)) {
  StrategyB[i] <- 
    switch (StrategyB[i],
    'A X' = 3 + 0, 
    'A Y' = 1 + 3, 
    'A Z' = 2 + 6, 
    'B X' = 1 + 0, 
    'B Y' = 2 + 3, 
    'B Z' = 3 + 6,
    'C X' = 2 + 0, 
    'C Y' = 3 + 3, 
    'C Z' = 1 + 6
    )
}

Part2Ans <- sum(as.numeric(StrategyB))  

paste("Part 1:", Part1Ans)
paste("Part 2:", Part2Ans)
