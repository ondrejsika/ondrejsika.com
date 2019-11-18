FROM ruby as build
WORKDIR /build
RUN gem update --system && gem install bundler
COPY Gemfile .
COPY install.sh .
RUN ./install.sh
COPY . .
RUN ./build.sh

FROM nginx
COPY --from=build /build/_site /usr/share/nginx/html