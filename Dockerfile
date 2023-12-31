FROM python:3.12
WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
RUN pip3 install --upgrade motor
RUN pip3 install --upgrade aiohttp

COPY . .
EXPOSE 8080
CMD python3 main.py
