class Ability < ActiveRecord::Base
  belongs_to :user

  validates :action, :model, :user_id, :presence => true
end
