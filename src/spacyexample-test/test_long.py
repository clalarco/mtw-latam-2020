from os.path import dirname, join

from spacyexample import SpacyExample


obj = SpacyExample()


def test_long_text():
    fixtures_dir = join(dirname(__file__), 'fixtures')
    filename = join(fixtures_dir, 'subterra.txt')
    doc = None
    with open(filename) as fd:
        doc = obj.parse(fd.read())
    assert obj.has_color(doc)
