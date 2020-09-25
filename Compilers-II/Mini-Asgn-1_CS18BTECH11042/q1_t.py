# Simple program to demonstrate how Python interpreter allows for dynamic types, and how variables can be declared without type being specified.
# Shreyas Havaldar, CS18BTECH11042
t = 2
print(t)
t = "Hello"
print(t)

# The variable t, whose type is not specified is first an integer with value 2, and is thus printed as 2 on the console. Later the same variable is assigned value "Hello", which is an string, thus the same variable is used for representing two data types in the same program. The data type it is representing need not even be explicitly specified.
# Command: python q1_t.py 
# Output:
# 2
# Hello