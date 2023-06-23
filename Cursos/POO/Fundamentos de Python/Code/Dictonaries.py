# [ ] = Listas
# ( ) = Tuplas
# { } = Diccionarios

# Diccionarios
my_dict = {}
print(type(my_dict)) # <class 'dict'>

my_dict = {
  'avion': "bla bla bla",
  'name': 'Nicolas',
  'last_name': 'Molina Monroy',
  'age': 87
} # { key: value }

print(my_dict) # {'avion': 'bla bla bla', 'name': 'Nicolas', 'last_name': 'Molina Monroy', 'age': 87}

print(len(my_dict)) # 4

print(my_dict['age']) # 87
print(my_dict['last_name']) # Molina Monroy
print(my_dict.get('age')) # 87

print('avion' in my_dict) # True
print('otroqueno' in my_dict) # False



# CRUD
person = {
  'name': 'nico',
  'last_name': 'molina',
  'langs': ['python', 'javascript'],
  'age': 99
} # { key: value }

print(person)


person['name'] = 'santi' # Update
person['age'] -= 50 # Update
person['langs'].append('rust') # Update
print(person) # {'name': 'santi', 'last_name': 'molina', 'langs': ['python', 'javascript', 'rust'], 'age': 49}


del person['last_name'] # Delete
person.pop('age') # Delete


print(person) # {'name': 'santi', 'langs': ['python', 'javascript', 'rust']}


print('items') # items
print(person.items()) # dict_items([('name', 'santi'), ('langs', ['python', 'javascript', 'rust'])])


print('keys') # keys
print(person.keys()) # dict_keys(['name', 'langs'])


print('values') # values
print(person.values()) # dict_values(['santi', ['python', 'javascript', 'rust']])