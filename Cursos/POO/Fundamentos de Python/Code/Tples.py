numbers = (1, 2, 3, 5)
strings = ('nico', 'zule', 'santi', 'nico')

print(numbers)
print('0 =>', numbers[0]) # 0 => 1
print('-1 =>', numbers[-1]) # -1 => 5
print(type(numbers)) # <class 'tuple'>

print(strings)
print(type(strings)) # <class 'tuple'>

# CRUD
# numbers.append(10)
print(numbers)
# numbers[1] = 'change'

print(strings)
print(strings.index('zule')) # 1
print(strings.count('nico')) # 2

my_list = list(strings) # Convertir tupla a lista
print(my_list) # ['nico', 'zule', 'santi', 'nico']
print(type(my_list)) # <class 'list'>

my_list[1] = 'juli' # Cambiar valor de la lista
print(my_list) # ['nico', 'juli', 'santi', 'nico']

my_tuple = tuple(my_list) # Convertir lista a tupla
print(my_tuple) # ('nico', 'juli', 'santi', 'nico')