file = open("./text.txt")
# print(file.read())
# print(file.readline())
# print(file.readline())
# print(file.readline())
# print(file.readline())

for line in file:
    print(line)

file.close()



# Otra forma de abrir un archivo es con with
with open("./text.txt") as file: # with nos permite abrir un archivo y cerrarlo automaticamente
    for line in file:
        print(line)
