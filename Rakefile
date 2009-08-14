require 'pathname'
require 'rubygems'

ROOT    = Pathname(__FILE__).dirname.expand_path
JRUBY   = RUBY_PLATFORM =~ /java/
WINDOWS = Gem.win_platform?
SUDO    = (WINDOWS || JRUBY) ? '' : ('sudo' unless ENV['SUDOLESS'])

require ROOT + 'lib/dm-is-example/is/version'

AUTHOR = 'John Doe'
EMAIL  = 'john [a] doe [d] com'
GEM_NAME = 'dm-is-example'
GEM_VERSION = DataMapper::Is::Example::VERSION
GEM_DEPENDENCIES = [['dm-core', GEM_VERSION]]
GEM_CLEAN = %w[ log pkg coverage ]
GEM_EXTRAS = { :has_rdoc => true, :extra_rdoc_files => %w[ README.txt LICENSE TODO History.txt ] }

PROJECT_NAME = 'datamapper'
PROJECT_URL  = "http://github.com/datamapper/dm-more/tree/master/#{GEM_NAME}"
PROJECT_DESCRIPTION = PROJECT_SUMMARY = 'Example of a DataMapper plugin'

[ ROOT, ROOT.parent ].each do |dir|
  Pathname.glob(dir.join('tasks/**/*.rb').to_s).each { |f| require f }
end
