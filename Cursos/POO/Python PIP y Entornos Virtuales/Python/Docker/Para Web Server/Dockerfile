FROM python:3.8


WORKDIR /app
COPY requirements.sh /app/requirements.sh


RUN pip install --no-cache-dir -upgrade -r /app/requirements.sh


COPY . /app

# Para Web Server (Flask, Django, etc)
CMD [ "unicorn", "Main:app", "--host", "0.0.0.0", "--port", "8000"]