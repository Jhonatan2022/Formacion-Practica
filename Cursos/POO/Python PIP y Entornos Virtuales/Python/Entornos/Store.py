import requests


def get_categories():
    r = requests.get('https://api.escuelajs.co/api/v1/categories')
    print(r.status_code) # Status Code nos indica si la petición fue exitosa
    print(r.text)
    print(type(r.text))


    categories = r.json() # Convertimos el texto a un diccionario

    for category in categories:
        print(category['name'])