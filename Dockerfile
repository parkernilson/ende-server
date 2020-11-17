FROM tensorflow/tensorflow:latest

WORKDIR /code

# Use the english to german pretrained translation model from OpenNMT
ADD https://s3.amazonaws.com/opennmt-models/averaged-ende-export500k-v2.tar.gz /models/ende/
RUN mkdir -p /models/ende/1
RUN tar xzf /models/ende/averaged-ende-export500k-v2.tar.gz -C /models/ende/1 --strip-components=1

COPY requirements.txt .

RUN pip install -r requirements.txt

COPY . .

ENTRYPOINT [ "bash", "./launch-server.sh" ]