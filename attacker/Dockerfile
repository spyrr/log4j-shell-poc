FROM alpine:3.15.0

ENV USERIP "127.0.0.1"
ENV WEBPORT "18080"
ENV LPORT "11111"

RUN apk update
RUN apk add python3 py3-pip openjdk8 build-base python3-dev libffi-dev tmux

RUN rm /usr/bin/javac && \
    ln -s /usr/lib/jvm/java-1.8-openjdk/bin/javac /usr/bin/javac

RUN mkdir -p /app/bin && \
    mkdir -p /app/target
COPY requirements.txt /app

WORKDIR /app
RUN pip install -U pip
RUN cd /app && \
    pip install -r ./requirements.txt && \
    pip install pynacl
RUN pip install pwncat-cs

COPY poc.py /app
COPY bin/start.sh /app/bin/start.sh
COPY target/* /app/target/

RUN sed -i -E "s/(os\.path\.join\(CUR_FOLDER, )('|\")(jdk1\.8\.0_20\/bin\/java)(c?)('|\")(\))/'\/usr\/bin\/java\4'/" poc.py
RUN chmod 755 /app/bin/start.sh

EXPOSE 1389
EXPOSE 18080 
EXPOSE 22222 

CMD ["/app/bin/start.sh"]
