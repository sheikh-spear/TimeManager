
#!/bin/bash
cd API

mix deps.get

mix ecto.create
mix ecto.migrate

mix phx.server

cd ../