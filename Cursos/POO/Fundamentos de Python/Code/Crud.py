# CRUD Create, Read, Update & Delete

numbers = [1, 2, 3, 4, 5]
print(numbers[1])
numbers[-1] = 10
print(numbers)

numbers.append(700) # Agrega un elemento al final de la lista
print(numbers)

numbers.insert(0, "hola") # Agrega un elemento en la posición indicada
print(numbers)

numbers.insert(3, "change")
print(numbers)

tasks = ["todo 1", "todo 2", "todo 3"]
new_list = numbers + tasks # Concatena dos listas
print(new_list)

index = new_list.index("todo 2") # Devuelve el indice del elemento
new_list[index] = "todo changed" # Cambia el elemento en la posición indicada
print(new_list)

new_list.remove("todo 1") # Elimina el elemento indicado
print(new_list)

new_list.pop() # Elimina el ultimo elemento de la lista
print(new_list)

new_list.pop(0) # Elimina el elemento en la posición indicada
print(new_list)

new_list.reverse() # Invierte el orden de la lista
print(new_list)

numbers_a = [1, 4, 6, 3]
numbers_a.sort() # Ordena la lista de menor a mayor
print(numbers_a)

strings = ["re", "ab", "ed"]
strings.sort() # Ordena la lista de menor a mayor
print(strings)

new_list.sort() # Ordena la lista de menor a mayor