import sys


# Muestra la ruta donde se encuentra el archivo
print(sys.path) 



import re

text = "Mi numero de telefono es 311 123 121, el codigo del pais es 57, mi numero de la suerte 3"

# Busca todos los numeros en el texto
result = re.findall("[0-9]+", text)
print(result) # ['311', '123', '121', '57', '3']



import time

# Muestra la hora actual en segundos
timestamp = time.time()
print(timestamp) # 1630544400.0

# Muestra la hora actual en formato local
local = time.localtime()
print(local) # time.struct_time(tm_year=2021, tm_mon=9, tm_mday=1, tm_hour=21, tm_min=0, tm_sec=0, tm_wday=2, tm_yday=244, tm_isdst=0)

# Muestra la hora actual en formato UTC
result = time.asctime(local)
print(result) # Wed Sep  1 21:00:00 2021



import collections

# Cuenta la cantidad de veces que se repite un numero en la lista
numbers = [1, 1, 2, 1, 2, 1, 4, 5, 3, 3, 21]

# Muestra la cantidad de veces que se repite un numero en la lista
counter = collections.Counter(numbers)
print(counter)
