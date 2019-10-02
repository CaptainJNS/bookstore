# require 'webdrivers/chromedriver'
# require 'webdrivers/geckodriver'
# require 'webdrivers/iedriver'
# require 'webdrivers/edgedriver'

# Capybara.register_driver :selenium_chrome do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end

# Capybara.javascript_driver = :selenium_chrome
# require "selenium/webdriver"

# Capybara.register_driver :chrome do |app|
#   Capybara::Selenium::Driver.new(app, browser: :chrome)
# end

# Capybara.register_driver :headless_chrome do |app|
#   capabilities = Selenium::WebDriver::Remote::Capabilities.chrome(
#     chromeOptions: { args: %w(headless disable-gpu) }
#   )

#   Capybara::Selenium::Driver.new app,
#     browser: :chrome,
#     desired_capabilities: capabilities
# end

# Capybara.javascript_driver = :headless_chrome
