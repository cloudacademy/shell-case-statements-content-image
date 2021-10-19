# CHANGE - Using the same image as the workspace container noticeably improves lab start-up time
FROM 421805900968.dkr.ecr.us-east-2.amazonaws.com/cloudacademy/labs-workspace/yaml-python
# You may need to change this depending on the OS of your FROM image (debian/RHEL/alpine have different package managers)
# Coreutils is a required dependency
# You can also install tools to be used by the Makefile checks although it is preferred to include everything in the workspace
# image to allow running the tests from the browser IDE experience
# RUN sudo apt-get update && sudo apt-get install -y coreutils netcat bash
USER root
WORKDIR /root/lab/
# src will contain the contents of the /home/project dir
COPY src ./src 
# home for your makefile
COPY test ./test
CMD [ "-f", "/dev/null" ]
ENTRYPOINT [ "tail" ]
