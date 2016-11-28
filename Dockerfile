FROM babim/alpinebase

RUN 	mkdir /etc/container_environment &&\
        chmod a+x /runit && mkdir /etc/service && mkdir /etc/runit_init.d && \
        echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
        apk --update upgrade && apk add runit && rm -rf /var/cache/apk/*

ADD start_runit /sbin/
CMD ["/sbin/start_runit"]
