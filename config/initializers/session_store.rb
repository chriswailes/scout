# Be sure to restart your server when you modify this file.

Scout::Application.config.session_store :cookie_store, key: '_scout_session'

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rails generate session_migration")
# Scout::Application.config.session_store :active_record_store
