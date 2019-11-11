FROM jmeritt/debian-htpc

RUN apt-get update && apt-get install -y git python python-pip
RUN pip install pyopenssl urllib3 apprise

USER htpc

RUN cd ~ && \
	git clone https://gitlab.com/LazyLibrarian/LazyLibrarian.git


EXPOSE 5299

VOLUME /ebooks
VOLUME /downloads
VOLUME /programdata
VOLUME /config

WORKDIR /home/htpc/LazyLibrarian
CMD python LazyLibrarian.py --config /config/config.ini --datadir /programdata --nolaunch

