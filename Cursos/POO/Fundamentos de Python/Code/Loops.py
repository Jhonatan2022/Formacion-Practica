'''
while True:
  print('se ejecuto')


counter = 0

while counter < 10:
  counter += 1
  print(counter)


counter = 0

while counter < 20:
  counter += 1
  if counter == 15:
    break
  print(counter)
'''

counter = 0

while counter < 20:
  counter += 1
  if counter < 15:
    continue # Salta a la siguiente iteracion del ciclo sin ejecutar el codigo que sigue
  print(counter)




'''
for numbers in range(0, 10):
    print(numbers)

'''

list = [1, 2, 3, 4, 5, 6, 7, 8, 9]
for numbers in list:
    print(numbers)


tuple = (1, 2, 3, 4, 5, 6, 7, 8, 9)
for numbers in tuple:
    print(numbers)


dict = {
    'name': 'nico',
    'last_name': 'molina',
    'age': 99
}
for key in dict:
    print(key, '=>', dict[key])

for key, value in dict.items():
    print(key, '=>', value)


people = [
    {
        'name': 'nico',
        'last_name': 'molina',
        'age': 99
    },
    {
        'name': 'santi',
        'last_name': 'molina',
        'age': 99
    },
    {
        'name': 'zule',
        'last_name': 'molina',
        'age': 99
    }
]

for person in people:
    print(person['name'], person['last_name'])