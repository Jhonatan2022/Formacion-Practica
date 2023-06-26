with open("./texs.txt", "w+") as file:
    for line in file:
        print(line)
    file.write("nuevas cosas en este archivo\n") # w+ nos permite escribir en un archivo
    file.write("otra linea\n")
    file.write(" mas linea\n")
