import json

numbers = [1,2,3,4,5]


new_numbers = list(filter(lambda x: x % 2 == 0, numbers))


print(new_numbers)
print(numbers)




# Filter Dictionary
matches = [
  {
    'home_team': 'Bolivia',
    'away_team': 'Uruguay',
    'home_team_score': 3,
    'away_team_score': 1,
    'home_team_result': 'Win'
  },
  {
    'home_team': 'Brazil',
    'away_team': 'Mexico',
    'home_team_score': 1,
    'away_team_score': 1,
    'home_team_result': 'Draw'
  },
  {
    'home_team': 'Ecuador',
    'away_team': 'Venezuela',
    'home_team_score': 5,
    'away_team_score': 0,
    'home_team_result': 'Win'
  },
]


print(matches)
print(len(matches))


new_list = list(filter(lambda item: item['home_team_result'] == 'Win', matches))


print(new_list)
print(len(new_list))


# Imprimimos matches en formato JSON
# Drump es para darle formato al JSON
# Indent es para darle formato al JSON
print(json.dumps(matches, indent=2))
print(len(matches))





# Retornando solo palabras de 4 letras o más
# list
words = ['amor', 'sol', 'piedra', 'día']


#cuenta el numero de elementos de words
print(f'List number of words \n{len(words)}')


#realiza un for que cuenta la candidad de letras en la lista words y realiza un append a la lista numbers_wods
numbers_letters = []
for i in words:
    numbers_letters.append(len(i))    
print(f'List number letters in numbers_letters\n{numbers_letters}')


#list comprehension del paso anterior
numbers_letters_v2 = [len(i) for i in words]
print(f'List number letters in numbers_letters_v2 \n{numbers_letters_v2}')


#utilizar filter y lambda para el paso anterior 
def filter_by_length(words):
    numbers_letters_v3 = list(filter(lambda i:len(i) >= 4, words))
    return numbers_letters_v3


print(f'Result of filter_by_length \n{filter_by_length(words)}')