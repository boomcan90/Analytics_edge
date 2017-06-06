# Getting help in R:
help(function)
?function

# You can also start help by running the following command: 
help.start()

# Commands are separated by ";" or by a new line
# Comments are with "#"

# Show all objects in memory with 
objects() 
# Remove objects from memory with 
rm(obeject, object2)

# Assignments: 
v1 <- c(10.4, 5.6, 3.1)
# This stores the vector [10.4, 5.6, 3.1] in the variable v1. This is the same as
assign("v1", c(10.4, 5.6, 3.1))

# Working with complex numbers: 
# Just need to explicitly state the complex part of the number. FOR EXAMPLE: 
sqrt(-17) # Normal
sqrt(-17+0i) #Complex

# Sequences: 
seq(from, to, by)
# To repeat: 
rep()

# two ways: 
> rep(c(1,2,3), each=2)
[1] 1 1 2 2 3 3
> rep(c(1,2,3), times=2)
[1] 1 2 3 1 2 3

