FROM debian:buster-slim

RUN apt-get update && apt-get install -y --no-install-recommends \
  xorg \  
  libssl-dev \
  libxrender-dev \
  wget \
  gdebi \
  fonts-noto-cjk \
  fonts-noto-cjk-extra \
  ca-certificates \
  && rm -rf /var/lib/apt/lists/* \
  && apt-get autoremove \
  && apt-get clean

RUN wget https://github.com/jgm/pandoc/releases/download/2.11.2/pandoc-2.11.2-1-amd64.deb -O pandoc.deb \
    && dpkg -i ./pandoc.deb \
    && rm pandoc.deb

RUN wget https://github.com/wkhtmltopdf/wkhtmltopdf/releases/download/0.12.5/wkhtmltox_0.12.5-1.buster_amd64.deb -O wkhtmltox.deb \
    && dpkg -i ./wkhtmltox.deb \
    && rm wkhtmltox.deb

RUN mkdir /var/tmp/output