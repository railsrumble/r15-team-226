# require 'dragonfly'
#
# # Configure
# Dragonfly.app.configure do
#   plugin :imagemagick
#
#   secret "1218c48433aa8c091cee8f400e561ef2f35771123da26d6ac186affe11f154c1"
#
#   url_format "/media/:job/:name"
#
#   datastore :file,
#     root_path: Rails.root.join('public/system/dragonfly', Rails.env),
#     server_root: Rails.root.join('public')
# end
#
# # Logger
# Dragonfly.logger = Rails.logger
#
# # Mount as middleware
# Rails.application.middleware.use Dragonfly::Middleware
#
# # Add model functionality
# if defined?(ActiveRecord::Base)
#   ActiveRecord::Base.extend Dragonfly::Model
#   ActiveRecord::Base.extend Dragonfly::Model::Validations
# end


require 'dragonfly'
require 'my_data_store'
require 'storage'
#require 'aws'

#s3 = AWS::S3.new(
#  :s3_endpoint => 'rest.s3for.me',
#  :access_key_id => '6ADCB8D169F91BDC78FA19EE039B9730',
#  :secret_access_key => '6bf05fd1b330d70268035e02e82a2a7fbfa7dc07')
#s3.buckets.each do |bucket|
#  puts bucket.name
#end

#app = Dragonfly.app
# Configure

Dragonfly.app.configure do
  protect_from_dos_attacks true

url_format '/media/:job/:sha/:name'
allow_legacy_urls true

  datastore :s3forme,
    url_host: 'change.rest.s3for.me',
    bucket_name: 'change',
    region: 'custom-region',
    access_key_id: '6ADCB8D169F91BDC78FA19EE039B9730',
    secret_access_key: '6bf05fd1b330d70268035e02e82a2a7fbfa7dc07',
    host: 'rest.s3for.me',
    path_style: true,
    url_scheme: "http",
    scheme: "http"
    #root_path: Rails.root.join('public/system/dragonfly', Rails.env),
    #server_root: Rails.root.join('public')
end
# Logger
Dragonfly.logger = Rails.logger

# Mount as middleware
Rails.application.middleware.use Dragonfly::Middleware

# Add model functionality
if defined?(ActiveRecord::Base)
  ActiveRecord::Base.extend Dragonfly::Model
  ActiveRecord::Base.extend Dragonfly::Model::Validations
end
Dragonfly.app.datastore

module Excon
   class Connection
      VALID_CONNECTION_KEYS = "change.rest.s3for.me"
   end
end
#S3
#app.datastore = :s3

# Logger
Dragonfly.logger = Rails.logger

#app.datastore.configure do |c|
#  c.bucket_name = "foodshop-india"
#  c.access_key_id = "AKIAI6LH24OJG52TWR5Q"
#  c.secret_access_key = "vwcT7sgK98HOHVMcz1sRF6xUTAbSJhONsjc4"
  #c.region = ENV['AWS_REGION']
#  c.storage_headers = {'x-amz-acl' => 'public-read'}      # defaults to {'x-amz-acl' => 'public-read'}
  #c.url_scheme = "https"                        # defaults to 'http'
# end
