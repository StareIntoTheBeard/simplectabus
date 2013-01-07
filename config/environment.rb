# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
Ctatimes::Application.initialize!
Time::DATE_FORMATS[:yep] = "%H:%M"
