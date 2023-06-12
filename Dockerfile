FROM node:18-alpine

ARG BUILD_ARG_PARAM

RUN echo ${NPM_TOKEN} > /tmp/build-info.txt

RUN echo ${BUILD_ARG_PARAM} >> /tmp/build-info.txt

CMD ["cat", "/tmp/build-info.txt"]