Public Function Prueba(X As Integer) As Integer

    suma = X + 38

End Function


'Subrutina
Public Sub Prueba2()

    'Seleccionamos otra hoja
    Sheets("Netflix").Select
    
    'Hacemos referencia a celdas
    Cells(1, 1) = "Hola mundo"
    Range(Cells(2, 2), Cells(3, 4)) = "Che"
    Range("A5:A7") = "O"
End Sub



Public Function div(numerador As Integer, denominador As Integer) As Double

    div = numerador / denominador
    
    'Mostramos un mensaje y convertimos el resultado en String
    MsgBox ("El Resultado es: " + CStr(div))
    MsgBox ("El Resultado es: " & div, )
    
End Function