#!/bin/sh

ssh rails@wbl 'cd app && git pull'
ssh rails@wbl 'cd app && bundle install'
ssh rails@wbl 'cd app && bundle exec rake assets:precompile'
ssh root@wbl '/etc/init.d/unicorn restart'
