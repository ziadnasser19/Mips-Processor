# Multiplication Function
# $6 is used as a virtual stack pointer so ITS VALUE IS NOT PRESERVED!
# Uses $5 as the address that contain the input 0($5), 1($5) are the inputs
# Uses $4, $3 to calculate the output, $2 as a counter but their values are preserved
# The output is returned in $5


# Set $2, $3, $4 with random values
addi $2, $0, -4  
addi $3, $0, 9
addi $4, $0, 10

# call mul function
addi $5, $0, 6
jal mul

exit: j exit

mul:

# Set the stack pointer at the last position in the memory
addi $6, $0, -1

# Save Preserved values
sw $4, 0($6) 
sw $3, -1($6)
sw $2, -2($6)

# Load inputs
lw $4, 0($5) 
lw $3, 1($5)

addi $2, $0, 0
addi $5, $0, 0

loop:
beq $2, $4, return
add $5, $5, $3
addi $2, $2, 1
j loop

return:

# Load Preserved values
lw $4, 0($6)
lw $3, -1($6)
lw $2, -2($6)

jr $7