FROM ubuntu:18.04

RUN set -ex \
  	&& sed -i -e "s%http://archive.ubuntu.com/ubuntu/%http://mirrors.aliyun.com/ubuntu/%g" /etc/apt/sources.list \
	&& apt-get update \
	&& apt-get install -y \
 			python-pip \
 			python-dev \
 			build-essential \
 	&& apt-get clean \
 	&& rm -rf /var/lib/apt/lists/* \
 	&& pip install --upgrade pip

ENV APPPATH /data/apps/
COPY . $APPPATH
WORKDIR $APPPATH
RUN pip install -r requirements.txt
ENTRYPOINT ["python"]
CMD  ["app.py"]
