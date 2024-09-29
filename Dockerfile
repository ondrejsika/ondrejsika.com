FROM ruby:3.1 as build-env
WORKDIR /build
RUN gem update --system && gem install bundler
COPY Gemfile .
COPY Gemfile.lock .
RUN bundle install
COPY --from=sikalabs/slu:v0.35.0 /usr/local/bin/slu /usr/local/bin/slu

FROM build-env as build
WORKDIR /build
COPY . .
RUN bundler exec jekyll build
ARG CI_COMMIT_TITLE=""
RUN ./generate-version-api.sh

FROM nginx
COPY ./nginx-site.conf /etc/nginx/conf.d/default.conf
COPY --from=build /build/_site /usr/share/nginx/html
