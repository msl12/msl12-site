## msl12's website

This is the source code of [my personal website](http://msl12.cn).

## Requirements

* **Nginx** as web server, config/nginx.conf is my nginx configuration snippet.
* **Elasticsearch** as search engine.

## Install

* run `bundle install`
* rename `config/app_config.example.yml` to `config/app_config.yml`
* rename `config/secrets.yml.default` to `config/secrets.yml`
* run `rake db:migrate` to create database
* run `rake secret` to generate session secret key and fill it in `secrets.yml`
* run `rake assets:precompile RAILS_ENV=production` to precompile assets
* run `rake environment elasticsearch:import:model CLASS='Blog' FORCE=y` to reindex ElasticSearch
* then run `rails s` or `puma -C config/puma.rb` or something else to start the rails project