ARG NODE_VERSION=20
FROM node:$NODE_VERSION-alpine

WORKDIR /quartz

RUN apk add git

RUN git clone https://github.com/soukouki/quartz.git -b soukouki/missing-link /quartz && cd quartz

RUN npm i
# required as directory was removed from original quartz repo
RUN mkdir -p content && touch content/.gitkeep
RUN npx quartz create -X new -l shortest

COPY entrypoint.sh /

ENTRYPOINT [ "/entrypoint.sh" ]