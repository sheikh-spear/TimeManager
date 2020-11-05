#!/bin/bash

export PGUSER=postgres
export PGPASSWORD=postgres
export PGDATABASE=time_manager_dev
export PGPORT=5432
export PGHOST='172.19.0.2'

mix deps.get

mix ecto.create
mix ecto.migrate

mix run priv/repo/seeds.exs

mix phx.server

