#!/bin/sh

PREV_HASH=`ssh rails@wbl "cd app && git rev-parse HEAD"`

ssh rails@wbl 'cd app && git pull'

GEMFILE_CHANGE=`ssh rails@wbl "cd app && git diff --name-only $PREV_HASH HEAD -- Gemfile.lock"`
SCHEMA_CHANGE=`ssh rails@wbl "cd app && git diff --name-only $PREV_HASH HEAD -- db/schema.rb"`
ASSETS_CHANGE=`ssh rails@wbl "cd app && git diff --name-only $PREV_HASH HEAD -- app/assets"`

if [ -n "$GEMFILE_CHANGE" ]; then
    echo 'Gemfile changed. Running "bundle install". '
    ssh rails@wbl 'cd app && bundle install'
fi

if [ -n "$SCHEMA_CHANGE" ]; then
    echo 'Schema changed. Running "bundle exec rake db:migrate". '
    ssh rails@wbl 'cd app && bundle exec rake db:migrate"'
fi

if [ -n "$ASSETS_CHANGE" ]; then
    echo 'Assets changed. Running "bundle exec rake assets:precompile". '
    ssh rails@wbl 'cd app && bundle exec rake assets:precompile'
fi

ssh root@wbl '/etc/init.d/unicorn restart'
