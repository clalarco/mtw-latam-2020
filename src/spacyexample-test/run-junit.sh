#!/bin/sh
pytest --junit-xml results.xml test_long.py test_1.py
sleep 300
