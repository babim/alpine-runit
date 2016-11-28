FROM babim/alpinebase

ADD start_runit /sbin/
ADD runssh.sh /runssh.sh

RUN 	mkdir /etc/container_environment &&\
        chmod a+x /sbin/start_runit /runssh.sh && mkdir /etc/service && mkdir /etc/runit_init.d && \
        echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
        apk --update upgrade && apk add runit openssh && rm -rf /var/cache/apk/*
        
EXPOSE 22
ENTRYPOINT ["/runssh.sh"]
CMD ["/sbin/start_runit"]
