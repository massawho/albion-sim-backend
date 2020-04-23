FROM elixir:1.10.2-alpine

WORKDIR /app

COPY mix.exs /app/mix.exs

RUN apk --update add openssh-client git nodejs nodejs-npm inotify-tools &&\
	rm -rf /var/cache/apk/* &&\
	mix local.hex --force &&\
	mix archive.install --force hex phx_new 1.4.16 &&\
	mix local.rebar --force &&\
	mix deps.get

# FRONTEND
#WORKDIR /app/assets
#COPY assets/.babelrc .
#COPY assets/elm.json .
#COPY assets/package.json .
#COPY assets/package-lock.json .
#COPY assets/webpack.config.js .
#RUN npm install

ENV APP_NAME albionsim
ENV APP_VERSION "0.0.1"
ENV PORT 4000

COPY . /app

WORKDIR /app
EXPOSE $PORT
