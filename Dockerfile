FROM ruby as build
WORKDIR /build
RUN gem update --system && gem install bundler
COPY Gemfile .
COPY install.sh .
RUN ./install.sh
COPY --from=sikalabs/slu:v0.27.1 /usr/local/bin/slu /usr/local/bin/slu
COPY . .
RUN ./build.sh
RUN ./generate-version-api.sh

FROM nginx
COPY ./nginx-site.conf /etc/nginx/conf.d/default.conf
COPY --from=build /build/_site /usr/share/nginx/html