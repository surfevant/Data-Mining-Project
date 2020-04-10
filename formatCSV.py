import re

outArr = []
with open("./DataSets/Edisto.csv", "r") as file:
    for line in file:
        strOut = re.sub("\s+", ",", line.strip())
        print(str)
        outArr.append(strOut)

with open('formatted_Edisto.csv', 'w') as file:
    for i in outArr:
        file.write(i+'\n')
