# Funsiones de Orden Superior
def increment(x):
  return x + 1


increment_v2 = lambda x: x +1 # lambda es una funcion anonima

def high_ord_func(x, func): # funcion de orden superior
  return x + func(x) # x + (x + 1)


high_ord_func_v2 = lambda x, func: x + func(x) # funcion de orden superior


result = high_ord_func(2, increment) 
# 2 + (2 + 1)
print(result)


result = high_ord_func_v2(2, increment_v2)
print(result) # 2 + (2 + 1)


result = high_ord_func_v2(2, lambda x: x + 2)
print(result) # 2 + (2 + 2)


## change
result = high_ord_func_v2(2, lambda x: x * 5)
print(result) # 2 + (2 * 5)