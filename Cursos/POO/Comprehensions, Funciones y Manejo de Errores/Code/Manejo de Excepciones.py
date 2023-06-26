try:
    print(0 / 0)
    assert 1 != 1, "Uno no es igual que uno"
    age = 10
    if age < 18:
        raise Exception("No se permiten menores de edad")
except ZeroDivisionError as error: # ZeroDivisionError sucede cuando se divide entre cero
    print(error)
except AssertionError as error:  # AssertionError sucede cuando una afirmacion falla
    print(error)
except Exception as error: # Exception es la clase base para todas las excepciones
    print(error)


print("Hola")
print("Hola 2")
