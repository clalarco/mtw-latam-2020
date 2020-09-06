from spacyexample import SpacyExample


obj = SpacyExample()


def test_has_color_1():
    doc = obj.parse("Esta es una pelota roja")
    assert obj.has_color(doc)


def test_has_color_2():
    doc = obj.parse("Esta es una pelota azul")
    assert obj.has_color(doc)


def test_has_color_3():
    doc = obj.parse("Esta es una pelota grande")
    assert not obj.has_color(doc)


def test_has_color_4():
    doc = obj.parse("Esta naranja es dulce")
    assert not obj.has_color(doc)


def test_has_color_5():
    doc = obj.parse("Esta pelota es de color naranja")
    assert obj.has_color(doc)


def test_has_color_6():
    doc = obj.parse("La camiseta de Chile es roja")
    assert obj.has_color(doc)


def test_has_color_7():
    doc = obj.parse("La Roja de todos se enfrenta a Australia")
    assert not obj.has_color(doc)
