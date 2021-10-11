FROM centos:7
# TODO: add multi-achitecture support via drone builds

VOLUME ["/data"]
COPY ./src/run.sh /run.sh
RUN chmod +x ./run.sh
CMD ["/run.sh"]