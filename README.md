# MATLAB-Project
This program takes the file name as an input argument and returns the node voltages.
The text file will include the information regarding circuits with the following rules:
• Each element is entered in a single row.
• The first column is the unique identifier for the element whose first letter indicates the
type of the element: R, I or V and the rest is an integer. The second and the third
columns denote the node numbers of the element. The last column denotes the value of
the element in Ohms, Amperes or Volts.
• NodeNumber@SecondColumn < NodeNumber@ThirdColumn.
• Positive value for the current source means that the current is entering the
Node@ThirdColumn.
• Positive value for the voltage source means:
Voltage of Node@SecondColumn < Voltage of Node@ThirdColumn.
