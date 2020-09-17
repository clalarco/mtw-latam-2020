FROM spacyexample as spacyexample-test

WORKDIR /usr/src/app/tests
COPY src/spacyexample-test .
RUN pip install --no-cache-dir -r requirements-test.txt
RUN ls

ENV TEST test_1.py
CMD python -m pytest ${TEST}
