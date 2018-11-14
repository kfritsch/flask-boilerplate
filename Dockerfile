FROM python:3.7

RUN apt-get update -y && apt-get install -y \
        build-essential \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

ADD requirements.txt /app/requirements.txt
RUN pip3 install -r requirements.txt

ADD . /app

# Expose the web port
EXPOSE 5010

CMD ["gunicorn",  "-b", ":5010", "app:app"]
