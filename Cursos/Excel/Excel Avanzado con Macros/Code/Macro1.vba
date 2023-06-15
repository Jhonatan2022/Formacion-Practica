Sub Macro1()
'
' Macro1 Macro
'
'
    Range(Selection, Selection.End(xlToRight)).Select
    Range(Selection, Selection.End(xlDown)).Select
    Selection.Columns.AutoFit
    Range("A1").Select
    Range(Selection, Selection.End(xlToRight)).Select
    With Selection.Interior
        .Pattern = xlSolid
        .PatternColorIndex = xlAutomatic
        .ThemeColor = xlThemeColorAccent5
        .TintAndShade = 0.599993896298105
        .PatternTintAndShade = 0
    End With
    Selection.Font.Bold = True
    With Selection
        .HorizontalAlignment = xlCenter
        .VerticalAlignment = xlBottom
        .WrapText = False
        .Orientation = 0
        .AddIndent = False
        .IndentLevel = 0
        .ShrinkToFit = False
        .ReadingOrder = xlContext
        .MergeCells = False
    End With
    Range("D1:F1").Select
    Range(Selection, Selection.End(xlDown)).Select
    Selection.End(xlDown).Select
    Selection.End(xlUp).Select
    Columns("D:F").Select
    Selection.EntireColumn.Hidden = True
    Range("A1").Select
End Sub