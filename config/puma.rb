#!/usr/bin/env puma

environment 'production'
daemonize true

stdout_redirect '/dev/null', '/dev/null', true

bind 'tcp://0.0.0.0:8080'
workers 1
preload_app!

on_worker_boot do
	ActiveSupport.on_load(:active_record) do
		ActiveRecord::Base.establish_connection
  	end
end

before_fork do
  ActiveRecord::Base.connection_pool.disconnect!
end