require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you're limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module InterpreterSupportApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.2

    # ▼ ここにデフォルトの言語を日本語にする設定を追加
    config.i18n.default_locale = :ja

    # Please, add to the `ignore` list any other `lib` subdirectories that do
    # not contain `.rb` files, or that should not be reloaded or eager loaded.
    # Common ones are `templates`, `generators`, or `middleware`, for example.
    config.autoload_lib(ignore: %w[assets tasks])

    # Configuration for the application, engines, and railties goes here.
    # ...
  end
end