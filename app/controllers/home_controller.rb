class HomeController < ApplicationController

  before_filter :is_admin?, :only => :administration

  def index
    @posts = Post.order("updated_at desc").all

    respond_to do |format|
      format.html
    end
  end

  def about
    respond_to do |format|
      format.html
    end
  end

  def administration
    
  end

end

