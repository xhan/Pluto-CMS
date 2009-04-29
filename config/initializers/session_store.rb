# Be sure to restart your server when you modify this file.

# Your secret key for verifying cookie session data integrity.
# If you change this key, all old sessions will become invalid!
# Make sure the secret is at least 30 characters and all random, 
# no regular words or you'll be exposed to dictionary attacks.
ActionController::Base.session = {
  :key         => '_pluto_cms_session',
  :secret      => '01ee40a6b8efb4d738157c5352133b732514fa0a34d0391fac55a71c5596dfaad8f15400a851d3b4d36b39a362a172fc857e44b56e591fb2bdc43b55aeab88a1'
}

# Use the database for sessions instead of the cookie-based default,
# which shouldn't be used to store highly confidential information
# (create the session table with "rake db:sessions:create")
# ActionController::Base.session_store = :active_record_store
