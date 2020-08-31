FROM alpine:latest as build

RUN apk update \
    && apk add lua5.1-dev git unzip make g++ curl openssl openssl-dev \
    && cd /tmp \
    && git clone https://github.com/keplerproject/luarocks.git \
    && cd luarocks \
    && sh ./configure \
    && make build install \
    && cd / \
    && rm -rf /tmp/luarocks

# install dependencies separately to not have --dev versions for them as well
RUN luarocks install luasec
RUN luarocks install lua-cjson
RUN luarocks install lualogging
# install latest scm rockspec --dev version
RUN luarocks install netatmo --dev



FROM  alpine:latest
RUN apk update && apk add lua5.1 openssl

COPY --from=build /usr/local/lib/lua /usr/local/lib/lua
COPY --from=build /usr/local/share/lua /usr/local/share/lua
COPY zipabox.lua /zipabox.lua

CMD lua /zipabox.lua
