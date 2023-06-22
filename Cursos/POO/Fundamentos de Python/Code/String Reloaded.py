text = "Ella sabe programar en Python"

"""
print('JavaScript' in text)
print('Python' in text)

if 'JS' in text:
  print('Elegiste bien!!')
else:
  print('Tambien elegiste bien')

"""

size = len(text)
print(size)

print(text) # Ella sabe programar en Python
print(text.upper()) # ELLA SABE PROGRAMAR EN PYTHON
print(text.lower()) # ella sabe programar en python
print(text.count("a")) # 4

print(text.swapcase()) # eLLA SABE PROGRAMAR EN pYTHON
print(text.startswith("Ella")) # True
print(text.endswith("Rust")) # False
print(text.replace("Python", "Go")) # Ella sabe programar en Go

text_2 = "este es un titulo"
print(text_2) # este es un titulo
print(text_2.capitalize()) # Este es un titulo
print(text_2.title()) # Este Es Un Titulo
print(text_2.isdigit()) # False
print("398".isdigit()) # True




# Indexing
text = "Ella sabe Python"
print(text[0]) # E
print(text[1]) # l
# print(text[999])
size = len(text) # 16
print('size => ',size) # 16
print(text[size - 1]) # n
print(text[-1]) # n

# slicing

print(text[0:5]) # Ella
print(text[10:16]) # Python
print(text[:10]) # Ella sabe
print(text[5:-1]) # sabe Pytho
print(text[5:]) # sabe Python
print(text[:]) # Ella sabe Python
print(text[10:16:1]) # Python
print(text[10:16:2]) # Pto
print(text[::2]) # Ela aePto