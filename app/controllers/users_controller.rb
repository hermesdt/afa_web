class UsersController < ApplicationController
  before_filter :is_admin?

  def index
    @users = User.all
    @users = @users.delete_if{|u| u.name == "admin" and u.email = "admin"}
  end

  def abilities
    @user = User.find_by_id(params[:id])
    @actions = %w(read manage)
    @models = %w(category field_category field_value plugin tag 
        post technique technique_temlate technique_type 
        template_field)

    empty_option = ["", ""]

    @actions_options = @actions.map{|action| [action, action]}.insert 0, empty_option
    @models_options = @models.map{|model| [model, model]}.insert 0, empty_option
  end

  def update_abilities
    user = User.find(params[:id])
    abilities = params[:ability]

    #borrar todas la relaciones previas entre usuario y ability
    Ability.destroy_all(:user_id => params[:id])

    #crear y asignar abilities al user
    abilities ||= []
    abilities.each do |ability|
      ability = Ability.create(:action => ability[:action], :model => ability[:model].camelize, :user_id => user.id)
      user.abilities << ability
    end

    redirect_to :action => :index
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.attributes = params[:user]
    if @user.save(:validate => false) 
      redirect_to :action => :index, :notice => "Correct!"
    else
      render :action => :edit, :alert => @user.errors.full_messages
    end

  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy

    redirect_to :action => :index
  end

end
