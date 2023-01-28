FROM ruby:3.1.2

RUN apt-get update -y && apt-get install sudo -y

RUN sudo apt-get update -y ; sudo apt-get upgrade -y openssl 

RUN sudo apt-get install -y unrar-free

RUN sudo apt-get install -y poppler-utils

RUN sudo apt-get install -y npm ; sudo npm install -g npm@latest
RUN sudo apt-get install -y build-essential libpq-dev cmake vim
RUN sudo apt-get update -y && sudo apt-get install postgresql-client -y

WORKDIR /arbnco_task

COPY Gemfile* /arbnco_task/

RUN gem install bundler

RUN bundle install

RUN bundle binstubs --all

RUN touch $HOME/.bashrc

RUN echo "alias ll='ls -alF'" >> $HOME/.bashrc
RUN echo "alias la='ls -A'" >> $HOME/.bashrc
RUN echo "alias l='ls -CF'" >> $HOME/.bashrc
RUN echo "alias q='exit'" >> $HOME/.bashrc
RUN echo "alias c='clear'" >> $HOME/.bashrc

CMD [ "/bin/bash" ]
