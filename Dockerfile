# syntax=docker/dockerfile:1.4

FROM ubuntu

COPY --link ./foo.txt .
COPY --link ./bar.txt .
RUN echo "$(cat foo.txt) $(cat bar.txt)" && rm -r foo.txt bar.txt

COPY --link ./baz.txt .

# In the actual Dockerfile, this step is where the failure occurred
# Crucially, the failure indicates that the missing files are foo.txt and bar.txt,
# not baz.txt.
RUN echo "$(cat baz.txt)" && rm -r baz.txt
