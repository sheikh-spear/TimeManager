FROM elixir:1.10.4

#Create a working directory
WORKDIR /app

# Update package manager
RUN apt-get update -y && apt upgrade -y && apt-get install -y \
# Add dependencies for Node
nodejs \
# inotify-tools
inotify-tools \
# sudo
sudo

RUN ls
RUN mix local.hex --force
RUN mix archive.install hex phx_new 1.5.6 --force

# Copy application in container
COPY . .

RUN mix local.rebar --force

EXPOSE 4000

# CMD ["bash", "entrypoint.sh"]
# CMD ["mix", "deps.get"]
