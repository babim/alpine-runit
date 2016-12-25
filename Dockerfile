FROM babim/alpinebase

ADD start_runit /sbin/

RUN 	mkdir /etc/container_environment &&\
        chmod a+x /sbin/start_runit && mkdir /etc/service && mkdir /etc/runit_init.d && \
        echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
        apk add --no-cache runit

CMD ["/sbin/start_runit"]
