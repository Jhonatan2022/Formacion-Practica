matriz = [
  [1,2,3],
  [4,5,6],
  [7,8,9]
]

print(matriz[0][1]) # 2

for row in matriz:
  print(row) # [1, 2, 3] [4, 5, 6] [7, 8, 9]
  for column in row:
    print(column) # 1 2 3 4 5 6 7 8 9