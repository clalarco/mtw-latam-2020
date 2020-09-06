# mtw-latam-2020
Demo para Mega Testing Week Latam 2020

Para crear la imagen del código (toma un tiempo, alrededor de 15 minutos):

    docker build -t spacyexample .


Para crear la imagen de test:

    docker build -t spacyexample-test -f test.Dockerfile .


Para ejecutar el test con el test por defecto:

    docker run spacyexample-test


Para ejecutar el test con otro test:

    docker run --env TEST=test_long.py spacyexample-test
