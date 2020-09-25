# Simple IO program to demonstrate how Python interpreter handles errors
# Shreyas Havaldar, CS18BTECH11042

print("Shreyas\n")
print("Havaldar\n)
print("CSE\n")
print("18\n)

# On interpreting the file, the python interpreter scans the program line by line and as it finds error in line 5, it stops and immediately displays the error. It does not scan for further errors until this one is resolved.
# Command: python q1.py 
# Output:
#   File "q1.py", line 5
#     print("Havaldar\n)
#                      ^
# SyntaxError: EOL while scanning string literal