set_countries = {'col', 'mex', 'bol'}


size = len(set_countries) # Muestra el tamaño del conjunto
print(size)

print('col' in set_countries) # Muestra si el elemento está en el conjunto
print('pe' in set_countries) # False


# add
set_countries.add('pe') # Agrega un elemento al conjunto
print(set_countries)
set_countries.add('pe') # No agrega un elemento al conjunto porque ya existe
print(set_countries)


# update
set_countries.update({'ar', 'ecua', 'pe'}) # Agrega varios elementos al conjunto
print(set_countries) # {'col', 'mex', 'pe', 'ecua', 'ar', 'bol'}


# remove
set_countries.remove('col') # Elimina un elemento del conjunto
print(set_countries)

set_countries.remove('ar')
set_countries.discard('arg') # Elimina un elemento del conjunto
print(set_countries)
set_countries.add('arg')
print(set_countries)
set_countries.clear() # Elimina todos los elementos del conjunto
print(set_countries)
print(len(set_countries)) # 0