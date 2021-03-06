FROM python:3.8-slim

EXPOSE 80

RUN pip install pipenv

COPY Pipfile Pipfile.lock ./

RUN pipenv install

COPY app app

ARG WEBHOOK_URL=${WEBHOOK_URL}

ENTRYPOINT [ "pipenv", "run", "app/app.py" ]
