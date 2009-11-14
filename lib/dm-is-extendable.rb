# Needed to import datamapper and other gems
require 'pathname'

# Add all external dependencies for the plugin here
gem 'dm-core', '0.9.12'
require 'dm-core'

# Require plugin-files
require Pathname(__FILE__).dirname.expand_path / 'dm-is-extendable' / 'is' / 'extendable.rb'
require Pathname(__FILE__).dirname.expand_path / 'dm-is-extendable' / 'is' / 'extension.rb'
require Pathname(__FILE__).dirname.expand_path / 'dm-is-extendable' / 'is' / 'version.rb'

# Include the plugin in Resource
module DataMapper
  module Model
    include DataMapper::Is::Extendable
    include DataMapper::Is::Extension
    include DataMapper::Is::Version
  end # module Model
end # module DataMapper
