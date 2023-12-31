FROM python:3.11
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade motor

COPY . .
EXPOSE 8080
CMD python3 main.py
