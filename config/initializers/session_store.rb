# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_Order_session',
  :secret      => 'a829e77683f02939628859bf0d3a627ff5c978f33c0c931213577b08b08ce32776bfe54ae4eb80732f642c79f13990e1ba83b8e888a7bd88e32f6cce4b5a9060'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
