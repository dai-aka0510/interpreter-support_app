#!/usr/bin/env bash
# エラーが発生した時点でスクリプトを終了する
set -o errexit

bundle install
bundle exec rails assets:precompile
bundle exec rails assets:clean
bundle exec rails db:migrate