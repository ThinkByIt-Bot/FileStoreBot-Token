FROM python:3.8-slim-buster

# Combine update and upgrade
RUN apt update && apt upgrade -y && \
    apt install git -y && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create a non-root user
RUN useradd -m myuser
USER myuser

WORKDIR /app

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt

COPY . .

EXPOSE 8080

CMD ["python3", "main.py"]
