#!/bin/sh
pytest --junit-xml results.xml test_long.py
sleep 300
