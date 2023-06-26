import Main


# Modulos como Scripts
# Si ejecutamos el modulo como script, el nombre de la variable __name__ sera __main__
# Si importamos el modulo, el nombre de la variable __name__ sera el nombre del modulo
# Esto nos permite ejecutar codigo solo si el modulo es ejecutado como script
# Esto nos permite ejecutar codigo solo si el modulo es importado
# Esto nos permite ejecutar codigo solo si el modulo es importado y ejecutado como script
# Esto nos permite ejecutar codigo solo si el modulo es importado y ejecutado como script, pero no si es importado
print(Main.data) # ['a', 'b', 'c']
Main.run()