require 'rubygems'
require 'dm-core'
# require 'dm-dates'
require 'dm-is-list'
# require 'dm-is-extendable'
require 'dm-types'

DataMapper.setup(:default, 'sqlite3::memory:')

module RG
  class Node
    include DataMapper::Resource

    property :id, Serial
    property :created_at, DateTime, :nullable => false
    property :updated_at, DateTime, :nullable => false
    property :deleted_at, ParanoidDateTime

    #is :extendable, :type_field => 'type', :type_field_id => 'type_id'
    is :list
  end

  class Table < Node
    property :caption, String
    property :cells, Text, :nullable => false
    property :header_cols, Integer, :nullable => false, :default => 0
    property :header_rows, Integer, :nullable => false, :default => 0
    property :footer_cols, Integer, :nullable => false, :default => 0
    property :footer_rows, Integer, :nullable => false, :default => 0
  end
end

DataMapper.auto_migrate!
