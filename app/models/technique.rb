class Technique < ActiveRecord::Base
  belongs_to :plugin
  belongs_to :technique_type

  validates :technique_type_id, :location, :presence => true
end
