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



Public Function div(denominador As Integer) As Double
    Dim a
    Dim numerador As Integer
    

    numerador = InputBox("Escriba el numerador: ")
    div = numerador / denominador
    'Mostramos un mensaje y convertimos el resultado en String
    MsgBox ("El Resultado es: " + CStr(div))
    a = MsgBox("El Resultado es: " & div, , "Resultado")
End Function



'Pasandolo a Sub Rutina
Public Sub divs()
    Dim num, den As Integer
    Dim mens


    num = InputBox("Numerador", "División")
    den = InputBox("Denominador", "División")
    mens = MsgBox(num / den, , "Divisón")
End Sub



Public Function SC(a As Integer, b As Integer, c As Integer) As String
    Dim suma As Integer
    
    suma = a + b + c
    
    Select Case suma
        Case Is < 0
            SC = "Valor Negativo"
        Case Is = 0
            SC = "Valor 0"
        Case Else
            SC = "Positivo"
    End Select
End Function



Public Function dado() As String
    Dim vd As Integer
    
    vd = Int((Rnd * 6) + 1)
    
    If vd Mod 2 = 0 Then
        dado = vd & " Par"
    Else:
        dado = vd & " Impar"
    End If
End Function



'Sucesión de Fibonacci como subrutina con ciclo for
Public Sub Fibonacci()
    Dim n, i, a, b, c As Integer
    
    n = InputBox("Ingrese el número de elementos de la sucesión: ")
    a = 0
    b = 1
    
    For i = 1 To n
        c = a + b
        a = b
        b = c
        MsgBox (c)
    Next i
End Sub


'Fibonacci con celdas
Public Sub Fibonacci()
    Dim n, i As Integer
    
    n = InputBox("Ingrese el número de elementos de la sucesión: ")
    
    Cells(1, 1) = 1
    Cells(2, 1) = 1
    
    For i = 3 To n
        Cells(i, 1) = Cells(i - 1, 1) + Cells(i - 2, 1)
    Next i
End Sub



Public Function DW() As Integer
    Dim dado, i, s As Integer
    
    dado = WorksheetFunction.RandBetween(1, 6)
    
    Do While s < 100
        i = i + 1
        s = s + dado
    Loop
    
    DW = i
End Function