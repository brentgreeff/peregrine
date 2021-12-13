## Install

`rvm install 2.7.2`
Any 2.7.* should be fine.

`gem install bundler`
`bundle`

## Run server

`PUMA_LOG_CONFIG=true bundle exec puma`

## Run server with reloading

`bundle exec rerun -- rackup`

open http://localhost:9292/

## Tests

`bundle exec guard` - to automatically run tests when they are saved.

`[enter]` to run all tests.

`open coverage/index.html` after running all tests to see the coverage report.
