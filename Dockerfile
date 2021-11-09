FROM ruby:2.3.8


# Prepara debian per Rails
RUN apt update -qq && \
    apt install -y build-essential

# Installa librerie mysql
RUN apt update -qq && \
    apt install -y default-libmysqlclient-dev

# Installa Node 14 LTS
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt install -y nodejs

WORKDIR /app


# Crea e usa utente rails
ARG user_name=rails
ARG user_uid=1000
RUN useradd -u $user_uid -Um $user_name -G audio,video && \
    chown -R $user_name:$user_name /app
USER $user_name


# Crea directory node_modules con utente rails
RUN mkdir /app/node_modules