# ENDE Translation Server
This is the translation server (written in the python framework Flask) for the En to De Translation project. It performs translation on endpoint `/translate/en-to-de`.

## Include Pretrained Model
This translation server requires the OpenNMT pretrained translation model (English to German / ENDE). This can be included in two ways:
1. Download and unzip the model yourself, then link it to the container at `/models/ende/1`
2. Include the model in the image by uncommenting the `add_model` build step.

The first method is probably preferable, since the image will be quite large if the pretrained model is included. It is already quite large because it needs to contain Tensorflow.