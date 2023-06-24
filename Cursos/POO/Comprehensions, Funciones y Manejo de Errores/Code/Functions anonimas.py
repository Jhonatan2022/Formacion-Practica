# Funsiones anonimas o lambdas
# Lambas: Son funciones anonimas, es decir, funciones que no tienen nombre


def increment(x):
    return x + 1


increment_v2 = lambda x: x + 1  # lambda argumentos: expresion

result = increment(10)
print(11)

result = increment_v2(20)
print(result)


full_name = (
    lambda name, last_name: f"Full name is {name.title()} {last_name.title()}"
)  # lambda argumentos: expresion
# La funcion title convierte la primera letra de cada palabra en mayuscula

text = full_name("nicolas", "perez casas")
print(text)
