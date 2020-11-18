## TODO: uncomment this if you would like to add the the model to the image instead of including model with a volume
# FROM ubuntu AS add_model

# # Use the english to german pretrained translation model from OpenNMT
# ADD https://s3.amazonaws.com/opennmt-models/averaged-ende-export500k-v2.tar.gz /models/ende/
# RUN mkdir -p /models/ende/1
# RUN tar xzf /models/ende/averaged-ende-export500k-v2.tar.gz -C /models/ende/1 --strip-components=1

FROM tensorflow/tensorflow:latest

WORKDIR /code

COPY requirements.txt .

RUN pip install -r requirements.txt

## TODO: uncomment this to use model from add_model build step
# COPY --from=add_model /models/ende/1 /models/ende/1

COPY . .

ENTRYPOINT [ "bash", "./launch-server.sh" ]