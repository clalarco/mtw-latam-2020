# Reference:
# https://github.com/cluttered-code/docker-spacy-alpine
FROM python:3.8-alpine as spacyexample
RUN apk update &&\
    apk upgrade &&\
    apk add --no-cache --virtual=build_deps g++ gfortran

WORKDIR /usr/src/app

# es_code_news_lg is big, so we install Spacy first.
# We use a dedicated requirements-spacy.txt to freeze dependencies
# and avoid running this layer if other packages in requirements.txt 
# changes
RUN python -m pip install --upgrade pip
RUN pip install wheel

COPY src/requirements-spacy.txt ./
RUN pip install --no-cache-dir -r requirements-spacy.txt

# Install SpacyExample
COPY src/setup.py  .
COPY src/spacyexample ./spacyexample
RUN pip install .

RUN python -m spacy download es_core_news_lg
