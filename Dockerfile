FROM nordstrom/baseimage-ubuntu:14.04
MAINTAINER Innovation Platform Team "invcldtm@nordstrom.com"

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C3173AA6
 && echo "deb http://ppa.launchpad.net/brightbox/ruby-ng/ubuntu trusty main" > /etc/apt/sources.list.d/brightbox_ruby.list \

RUN apt-get update -qy \
 && apt-get install -qy \
      ruby2.2 \
      ruby2.2-dev

RUN gem install bundler
