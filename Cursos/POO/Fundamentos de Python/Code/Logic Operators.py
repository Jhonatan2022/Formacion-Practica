# Operadores logicos
# and
print('AND')
print('True and True =>', True and True) # True
print('True and False =>', True and False) # False
print('False and True =>', False and True) # False
print('False and False =>', False and False) # False

print(10 > 5 and 5 < 10) # True
print(10 > 5 and 5 > 10) # False

stock = input('Ingrese el numero de stock => ')
stock = int(stock) # Convertir a entero

print(stock >= 100 and stock <= 1000) # True

print('OR')
print('True or True =>', True or True) # True
print('True or False =>', True or False) # True
print('False or True =>', False or True) # True
print('False or False =>', False or False) # False

role = input('Digita el rol => ') # admin, seller, customer

print(role == 'admin' or role == 'seller') # True




# Operador de negación
print(not True) # False
print(not False) # True

# and
print('NOT AND') 
print('not True and True =>', not (True and True)) # False
print('not True and False =>', not (True and False)) # True
print('not False and True =>', not (False and True)) # True
print('not False and False =>', not (False and False)) # True

stock = input('Ingrese el numero de stock => ') # 100
stock = int(stock) # Convertir a entero

print(not (stock >= 100 and stock <= 1000)) # False