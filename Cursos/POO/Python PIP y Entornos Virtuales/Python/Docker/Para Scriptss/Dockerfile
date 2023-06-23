FROM python:3.8


WORKDIR /app
COPY requirements.sh /app/requirements.sh


RUN pip install --no-cache-dir -upgrade -r /app/requirements.sh


COPY . /app


CMD bash -c "while true; do sleep 1; done"