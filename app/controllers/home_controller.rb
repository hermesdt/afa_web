class HomeController < ApplicationController

  before_filter :is_admin?, :only => :administration

  def index

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

