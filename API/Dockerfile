FROM elixir:1.9.1-slim

# basic dependencies to make it all work
RUN apt-get update -qq && apt-get -y --allow-unauthenticated install curl libpq-dev postgresql-client git make erlang-crypto apt-transport-https

# creating a user for the app
ARG UID=1000
RUN useradd -m -u $UID sheikh-spear
USER sheikh-spear

RUN mkdir /home/sheikh-spear/app
WORKDIR /home/sheikh-spear/app
RUN mkdir -p /home/sheikh-spear/app/deps; chown -R sheikh-spear:sheikh-spear /home/sheikh-spear/app/deps
VOLUME ["/home/sheikh-spear/app/deps"]

RUN mix local.hex --force
RUN mix local.rebar --force