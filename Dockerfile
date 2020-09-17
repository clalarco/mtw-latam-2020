# Reference:
# https://github.com/cluttered-code/docker-spacy-alpine
FROM python:3.8-alpine as spacyexample
RUN apk update &&\
    apk upgrade &&\
    apk add --no-cache --virtual=build_deps g++ gfortran curl

WORKDIR /usr/src/app

# es_code_news_lg is big, so we install Spacy first.
# We use a dedicated requirements-spacy.txt to freeze dependencies
# and avoid running this layer if other packages in requirements.txt 
# changes
RUN curl https://bootstrap.pypa.io/get-pip.py -o get-pip.py
RUN python get-pip.py
RUN rm get-pip.py
RUN pip install wheel

COPY src/requirements-spacy.txt ./
RUN pip install --no-cache-dir -r requirements-spacy.txt

# Install SpacyExample
COPY src/setup.py  .
COPY src/spacyexample ./spacyexample
RUN pip install .


# Spacy core can be es_core_news_sm, es_core_news_md or es_core_news_lg.
# We can use `--build-arg SPACY_CORE=es_core_news_md` on build to override.
ARG SPACY_CORE=es_core_news_sm
ENV SPACY_CORE=${SPACY_CORE}
RUN python -m spacy download ${SPACY_CORE}
