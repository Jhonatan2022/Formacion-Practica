import Store
from fastapi import FastAPI
from fastapi.responses import HTMLResponse

app = FastAPI()


@app.get('/')
def get_list():
    return ['item 1', 'item 2', 'item 3']



@app.get('/contact', response_class=HTMLResponse)
def get_contact():
    return '''
    <H1> Contact </H1>
    '''


def run():
    Store.get_categories()



if __name__ == '__main__':
    run()