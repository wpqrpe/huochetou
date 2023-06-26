FROM ubuntu
RUN echo $PORT && ping google.com -c 4
