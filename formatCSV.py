import re

outArr = []
with open("./DataSets/EdistoOffshore.csv", "r") as file:
    for line in file:
        strOut = re.sub("\s+", ",", line.strip())
        print(str)
        outArr.append(strOut)

with open('formatted_EdistoOffshore.csv', 'w') as file:
    for i in outArr:
        file.write(i+'\n')
