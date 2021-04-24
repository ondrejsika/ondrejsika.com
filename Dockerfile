FROM ruby:2.6 as build-env
WORKDIR /build
RUN gem update --system && gem install bundler
COPY Gemfile .
COPY install.sh .
RUN ./install.sh

FROM build-env as build
COPY . .
RUN ./build.sh

FROM nginx
COPY --from=build /build/_site /usr/share/nginx/html
