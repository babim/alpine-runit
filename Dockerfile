FROM babim/alpinebase

ADD start_runit /runit
ADD runssh.sh /runssh.sh
RUN 	mkdir /etc/container_environment &&\
        chmod a+x /runit && mkdir /etc/service && mkdir /etc/runit_init.d && \
        echo "http://dl-cdn.alpinelinux.org/alpine/edge/community" >> /etc/apk/repositories && \
        apk --update upgrade && apk add runit openssh && rm -rf /var/cache/apk/*
        
EXPOSE 22
ENTRYPOINT ["/runssh.sh"]
CMD ["/runit"]
