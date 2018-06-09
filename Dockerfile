FROM ubuntu:16.04

ADD setup.sh /setup.sh

RUN apt-get update && apt-get install -y wget vim less lsb-release uuid-runtime g++ cmake git
RUN wget https://ecsft.cern.ch/dist/cvmfs/cvmfs-release/cvmfs-release-latest_all.deb
RUN dpkg -i cvmfs-release-latest_all.deb
RUN apt-get update
RUN apt-get install -y cvmfs cvmfs-config-default
RUN echo "CVMFS_REPOSITORIES=sft.cern.ch" > /etc/cvmfs/default.local
RUN echo "CVMFS_HTTP_PROXY=DIRECT" >> /etc/cvmfs/default.local

CMD bash /setup.sh && bash
