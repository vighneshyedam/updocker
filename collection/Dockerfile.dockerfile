FROM python:3.8

LABEL version="1.0.0"

ENV username=${your_name}

WORKDIR /app

ARG creator=your_name

RUN python -m pip install flask
RUN python -m pip install --upgrade pip


COPY . /app

EXPOSE 8080

CMD ["python","app.py"]