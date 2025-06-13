# API: Ruby on Rails container
FROM ruby:3.2.3


# Install system dependencies
RUN apt-get update \
    && apt-get install -y nodejs postgresql-client sqlite3 \
    && rm -rf /var/lib/apt/lists/*

WORKDIR /app

# Install gems
COPY Gemfile* ./
RUN bundle install --jobs 4 --retry 3

# Copy application code
COPY . .

# Expose Rails port and run migrations + server
EXPOSE 3000
ENTRYPOINT ["bash", "-lc", "bundle exec rails db:create db:migrate && bundle exec rails server -b 0.0.0.0 -p 3000"]