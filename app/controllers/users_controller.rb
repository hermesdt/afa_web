class UsersController < ApplicationController
  before_filter :is_admin?

  def index
  end

  def edit
  end

  private
  def is_admin?
    raise Exception.new "Need to be admin" unless current_user.is_admin?
  end

end
