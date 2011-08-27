class User < ActiveRecord::Base

  has_many :abilities

  validates :name, :presence => true

  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :is_admin, :name, :email, :password, :password_confirmation, :remember_me
  def self.create_with_omniauth(auth)  
    create! do |user|  
      user.provider = auth["provider"]  
      user.uid = auth["uid"]  
      user.name = auth["user_info"]["name"]  
    end  
  end 
  
  def can?(action, model)
    if %w(index show read).include?(action.to_s)
      action = "read"
    elsif %w(edit new update destroy create).include?(action.to_s)
      action = "manage"
    elsif Ability.find_all_by_action(action).count == 0
      action = "manage"
    else
      action = "manage"
    end

    self.abilities.where("action = ? and model = ?", action, model).count > 0
  end
end
