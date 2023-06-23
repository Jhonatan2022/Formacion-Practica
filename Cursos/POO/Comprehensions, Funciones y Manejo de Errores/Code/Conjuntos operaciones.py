set_a = {'col', 'mex', 'bol'}
set_b = {'pe', 'bol'}

set_c = set_a.union(set_b) # Union
print(set_c)
print(set_a | set_b) # Union


set_c = set_a.intersection(set_b) # Intersección
print(set_c) # {'bol'}
print(set_a & set_b) # Intersección


set_c = set_a.difference(set_b) # Diferencia
print(set_c) # {'col', 'mex'}
print(set_a - set_b) # Diferencia (Muestra los elementos que están en set_a pero no en set_b)


set_c = set_a.symmetric_difference(set_b) # Diferencia simétrica
print(set_c) # {'col', 'mex', 'pe'}
print(set_a ^ set_b) # Diferencia simétrica (Muestra los elementos que están en set_a o en set_b pero no en ambos)