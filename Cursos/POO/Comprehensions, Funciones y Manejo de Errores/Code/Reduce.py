import functools


numbers = [1, 2, 3, 4]


def accum(counter, item):
    print("counter => ", counter)
    print("item => ", item)
    return counter + item


result = functools.reduce(accum, numbers)
print(result)
