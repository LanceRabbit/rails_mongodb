class Todo
  include Mongoid::Document
  field :title, type: String
  field :notes, type: String
  field :dead_line, type: DateTime
  field :state, type: Boolean
end
