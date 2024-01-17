FROM python:2-alpine

RUN set -ex && \
	apk add --no-cache git && \
	git clone https://github.com/shezi/airmtp.git

ENTRYPOINT ["python", "/airmtp/airmtp.py"]
CMD ["--ipaddress auto", "--outputdir /mnt"]
