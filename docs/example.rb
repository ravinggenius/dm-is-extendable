require 'dm-dates'
require 'dm-is-extendable'
require 'dm-is-list'

class Node
  include Datamapper::Resource

  property :id, Serial
  property :author_id, Integer, :nullable => false
  property :editor_id, Integer, :nullable => false
  property :created_at, DateTime, :nullable => false
  property :updated_at, DateTime, :nullable => false
  property :deleted_at, ParanoidDateTime

  is :extendable, :type_field => 'type', :type_field_id => 'type_id'
end

class Title < Node
  property :content, String, :nullable => false
end

class Text < Node
  property :content, Text, :nullable => false
end

class NestedNode < Node
  property :node_id, Integer, :nullable => false
end

class Page < Node
  has 0..n, :images
  has 0..n, :tables
  has 0..n, :texts
end

class Table < Node
  property :caption, String
  property :cells, Csv, :nullable => false
  property :header_cols, Integer, :nullable => false, :default => 0
  property :header_rows, Integer, :nullable => false, :default => 0
  property :footer_cols, Integer, :nullable => false, :default => 0
  property :footer_rows, Integer, :nullable => false, :default => 0
end

class Gallery < Node
  has 1..n, :images
end

class Image < Node
  property :preview, Blob
  property :content, Blob, :nullable => false
  property :caption, String
end

class Event < Node
  has 1, :daterange
  has 0..1, :text
end

class DateRange < Node
  property :start_date, DateTime, :nullable => false
  property :end_date, DateTime, :nullable => false
end

class List < Node
  property :caption, Text
  property :language, Discriminator

  has n, :list_items
end

class ListItem
  property :content, String, :nullable => false

  belongs_to :list

  is :list
end

