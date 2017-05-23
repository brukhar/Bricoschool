class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  config.relative_url_root = ""
end
