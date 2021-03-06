FROM python:3.6

# cache the freaking requirements.txt
RUN mkdir /code
COPY requirements.txt /code/requirements.txt
RUN pip install -r /code/requirements.txt
RUN rm /code/requirements.txt

COPY . /code
WORKDIR /code
RUN pip install .

VOLUME /code
VOLUME /markov

EXPOSE 8000

ENTRYPOINT ["python"]
CMD ["-m", "ofensivaria.app"]
