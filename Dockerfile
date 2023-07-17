FROM ruby:3.1.3
RUN apt-get update -qq && apt-get install -y nodejs postgresql-client
WORKDIR /myapp
COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

# Add a script to be executed every time the container starts.
EXPOSE 3000
ADD . /myapp
# Configure the main process to run when running the image
CMD ["rails", "server", "-b", "0.0.0.0"]
