require 'dm-is-list'
require 'dm-dates'


class Template
  include Datamapper::Resource

  property :id, Serial
  property :name, String, :nullable => false
  property :description, Text

  has n, :nodes
end

class Node
  include Datamapper::Resource

  property :id, Serial
  property :created_at, DateTime
  property :updated_at, DateTime
  property :deleted_at, ParanoidDateTime

  belongs_to :template
end

class Page < Node
  has 0..n, :images, :scope => :parts
  has 0..n, :tables, :scope => :parts
  has 0..n, :texts, :scope => :parts
end

class Gallery < Node
  has 1..n, :images, :scope => :parts
end

class Event < Node
  has 1, :daterange, :scope => :parts
  has 0..1, :text, :scope => :parts
end

class Part
  include Datamapper::Resource

  property :id, Serial
  property :subtitle, String, :nullable => false

  belongs_to :node
end

class Table < Part
  property :caption, String
  property :cells, Csv, :nullable => false
  property :header_cols, Integer, :nullable => false, :default => 0
  property :header_rows, Integer, :nullable => false, :default => 0
  property :footer_cols, Integer, :nullable => false, :default => 0
  property :footer_rows, Integer, :nullable => false, :default => 0
end

class DateRange < Part
  property :start_date, DateTime, :nullable => false
  property :end_date, DateTime, :nullable => false
end

class Text < Part
  property :content, Text, :nullable => false
end

class List < Part
  property :caption, Text
  property :language, Discriminator

  has n, :list_items
end

class ListItem
  property :content, String, :nullable => false

  belongs_to :list

  is :list
end

class Title < Part
  property :content, String, :nullable => false
end

class NestedNode < Part
  property :node_id, Integer, :nullable => false
end

class Image < Part
  property :preview, Blob
  property :content, Blob, :nullable => false
  property :caption, String
end

