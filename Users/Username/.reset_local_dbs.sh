echo 'Dropping development databases...'
rails db:drop RAILS_ENV=development

echo 'Creating development databases...'
rails db:setup RAILS_ENV=development

echo 'Flushing Sidekiq queues...'
RAILS_ENV=development bundle exec rails runner 'Sidekiq.redis { |conn| conn.flushdb }'

echo 'Clearing Capybara temp files...'
rm ~/Documents/Git/Coherent/tmp/capybara/*
rm -r ~/Documents/Git/Coherent/tmp/letter_opener/*

echo 'Removing development and test log files...'
rm ~/Documents/Git/Coherent/log/development.log
rm ~/Documents/Git/Coherent/log/test.log

echo 'Done.'