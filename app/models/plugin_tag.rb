class PluginTag < ActiveRecord::Base
  belongs_to :plugin
  belongs_to :tag

  validates :tag_id, :uniqueness => {:scope => :plugin_id}
end
