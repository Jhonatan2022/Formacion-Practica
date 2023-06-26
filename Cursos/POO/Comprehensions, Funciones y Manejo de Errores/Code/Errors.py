# print(0 / 0)
# print(result)
print('Hola')


# Errores en python (Exceptions)
suma = lambda x,y: x + y
assert suma(2,2) == 4 # assert es una palabra reservada que nos permite hacer una afirmacion

print('Hola 2')

age = 10
if age < 18:
  # Excepcion personalizada (Custom Exception) Nos permite crear nuestras propias excepciones
  raise Exception('No se permiten menores de edad')



print('Hola 2')



# Exception                    Description
# AssertionError              Se genera cuando falla una declaración de afirmación
# ArithmeticError              Se genera cuando se produce un error en los cálculos numéricos
# AttributeError              Se genera cuando falla la asignación o la referencia de atributo
# Exception                    Clase base para todas las excepciones
# EOFError                     Se genera cuando el método input() alcanza una condición de “fin de archivo” (EOF)
# FloatingPointError           Se genera cuando falla un cálculo de punto flotante
# GeneratorExit                Se genera cuando se cierra un generador (con el método close())
# ImportError                 Se genera cuando no existe un módulo importado
# IndentationError             Se genera cuando la sangría no es correcta
# IndexError                   Se genera cuando no existe un índice de una secuencia
# KeyError                     Se genera cuando una clave no existe en un diccionario
# KeyboardInterrupt          Se genera cuando el usuario presiona Ctrl+c, Ctrl+z o Eliminar
# LookupError                 Se genera cuando no se pueden encontrar los errores generados
# MemoryError                  Se genera cuando un programa se queda sin memoria
# NameError                    Se genera cuando una variable no existe
# NotImplementedError         Se genera cuando un método abstracto requiere una clase heredada para anular el método
# OSError                      Se genera cuando una operación relacionada con el sistema provoca un error
# OverflowError                Se genera cuando el resultado de un cálculo numérico es demasiado grande
# ReferenceError               Se genera cuando no existe un objeto de referencia débil
# RuntimeError                 Se genera cuando ocurre un error que no pertenece a ninguna expectativa específica
# StopIteration                Se genera cuando el método next() de un iterador no tiene más valores
# SyntaxError                  Se genera cuando se produce un error de sintaxis
# TabError                     Se genera cuando la sangría consta de tabulaciones o espacios
# SystemError                  Se genera cuando se produce un error del sistema
# SystemExit                   Se genera cuando se llama a la función sys.exit()
# TypeError                    Se genera cuando se combinan dos tipos diferentes
# UnboundLocalError            Se genera cuando se hace referencia a una variable local antes de la asignación
# UnicodeError                 Se genera cuando se produce un problema Unicode
# UnicodeEncodeError           Se genera cuando se produce un problema de codificación Unicode
# UnicodeDecodeError           Se genera cuando se produce un problema de decodificación Unicode
# UnicodeTranslateError        Se genera cuando se produce un problema de traducción Unicode
# ValueError                   Se genera cuando hay un valor incorrecto en un tipo de datos especificado
# ZeroDivisionError            Se genera cuando el segundo operador en una división es cero
