FROM mysterysd/wzmlx:heroku

WORKDIR /usr/src/app
RUN chmod 777 /usr/src/app

RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean all

RUN apt-get update && \
    apt-get install -y lsb-release gnupg && \
    apt-get clean all
    
    
RUN wget -q -O - https://mkvtoolnix.download/gpg-pub-moritzbunkus.txt | apt-key add - && \
    apt-get update && \
    apt-get install -y mkvtoolnix && \
    apt-get clean all

RUN apt-get -y clean
RUN apt-get -y autoremove

COPY . .
RUN pip3 install --no-cache-dir -r requirements.txt

CMD ["bash", "start.sh"]
