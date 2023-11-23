FROM python:3.8-slim-buster
RUN apt update && apt upgrade -y
RUN apt install git -y
WORKDIR /app
COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .
EXPOSE 8080

CMD python3 main.py
