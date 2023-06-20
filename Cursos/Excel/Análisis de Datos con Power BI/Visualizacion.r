# El código siguiente, que crea un dataframe y quita las filas duplicadas, siempre se ejecuta y actúa como un preámbulo del script: 

# dataset <- data.frame(EDAD, Suma linea)
# dataset <- unique(dataset)

# Pegue o escriba aquí el código de script:
vEDAD <- dataset$EDAD
vLinea <- dataset$SumaLinea

tabla <- matrix(c(vEDAD,vLinea), ncol=2)

plot(tabla)