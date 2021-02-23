echo 'Dropping development databases…'
rails db:drop RAILS_ENV=development

echo 'Creating development databases…'
rails db:setup RAILS_ENV=development

echo 'Dropping parallel test databases…'
rails parallel:drop

echo 'Creating parallel test databases…'
rails parallel:create

echo 'Flushing Sidekiq queues…'
RAILS_ENV=development bundle exec rails runner 'Sidekiq.redis { |conn| conn.flushdb }'

echo 'Clearing Capybara temp files…'
rm tmp/capybara/*
rm -r tmp/letter_opener/*

echo 'Removing development and test log files…'
rm log/development.log
rm log/test.log

echo 'Done.'
