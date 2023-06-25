numbers = [1, 2, 3, 4]

numbers_v2 = []
for i in numbers:
  numbers_v2.append(i * 2)


numbers_v3 = list(map(lambda i: i * 2, numbers))


print(numbers)
print(numbers_v2)
print(numbers_v3)


numbers_1 = [1, 2, 3, 4]
numbers_2 = [5, 6, 7]


print(numbers_1)
print(numbers_2)
result = list(map(lambda x, y: x + y, numbers_1, numbers_2))
print(result)



# Exercise: Multiply numbers
def multiply_numbers(numbers):
    # Escribe tu solución 👇
    result = list(map(lambda number: number * 2, numbers))
    return result

numbers = [1, 2, 3, 4]
response = multiply_numbers(numbers)
print(response)