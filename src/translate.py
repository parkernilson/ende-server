import pyonmttok
import tensorflow as tf

# load the en to de translation model
ende_loaded = tf.saved_model.load("/models/ende/1")
infer = ende_loaded.signatures["serving_default"]

# initialize tokenizer from sentencepiece model
tokenizer = pyonmttok.Tokenizer("none", sp_model_path="/models/ende/1/assets.extra/wmtende.model")

def translateEnToDe(phrase):
    """
    Translate a phrase from english to german
    """
    # tokenize the input phrase
    tokens, _ = tokenizer.tokenize(phrase)

    # use the model to perform translation
    result = infer(
        length=tf.constant([len(tokens)]),
        tokens=tf.constant([tokens]))
    
    # detokenize the result
    translation_tokens = result["tokens"].numpy()[0, 0].tolist()
    translation = tokenizer.detokenize(translation_tokens)

    # remove sequence end tags from the translated result
    return translation.replace("</s>", "")