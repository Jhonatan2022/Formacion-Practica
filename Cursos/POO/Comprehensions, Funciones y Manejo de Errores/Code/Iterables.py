# Iterables and Iterators
for i in range(1, 10):
    print(i)


my_iter = iter(range(1, 4)) # iter() crea un iterador ( un objeto que puede ser iterado)
print(my_iter) # <range_iterator object at 0x0000020D1F6F4F00>
print(next(my_iter)) # next() regresa el siguiente elemento del iterador
print(next(my_iter))
print(next(my_iter))
print(next(my_iter))
