from os import getenv
import spacy


class SpacyExample:

    def __init__(self):
        self.nlp = spacy.load(getenv("SPACY_CORE", "es_core_news_sm"))

    def parse(self, phrase):
        doc = self.nlp(phrase)
        for token in doc:
            print(token.text, token.pos_, token.dep_, token.lemma_, token.head.text)
        return doc

    colors = ['blanco', 'negro', 'rojo', 'azul', 'verde', 'amarillo', 'naranjo', 'naranja', 'celeste']

    def has_color(self, doc):
        def _is_color(d):
            return ((d.pos_ == "ADJ") or (d.pos_ == 'PROPN' and d.dep_ == "amod")) and d.lemma_ in self.colors
        color = next((d for d in doc if _is_color(d)), None)
        print(color)
        return color is not None
