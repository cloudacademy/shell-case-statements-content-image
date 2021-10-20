FROM 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/wetty-linuxproject:d961e1f
USER root
WORKDIR /root/lab/
COPY src ./src 
COPY test ./test
ENTRYPOINT [ "/bin/sh" ]
# CMD [ "-f", "/dev/null" ]
# ENTRYPOINT [ "tail" ]