require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module GenmaiApp
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.1

    config.generators do |g|
      g.assets false          # CSS, JavaScriptファイルは生成しない
      g.test_framework :rspec,  # testファイルは生成しない
        controller_specs: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false
    end

    config.i18n.default_locale = :ja

    # Configuration for the application, engines, and railties goes here.
    #
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    #
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    
    # 認証トークンをremoteフォームに埋め込む
    config.action_view.embed_authenticity_token_in_remote_forms = true

    # バリデーションエラー表示によるレイアウト崩れを防ぐため、自動でfield_with_errorsを挿入しないようにする。
    config.action_view.field_error_proc = Proc.new { |html_tag, instance| html_tag }
  end
end
