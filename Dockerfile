FROM ruby:3.1.3
RUN apt-get update -qq && apt-get install -y nodejs
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

EXPOSE 3000
ADD . /myapp
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
