class HomeController < ApplicationController

  skip_before_action :authenticate_user!, :only => [:index,:about]
  def index
    #code
  end
  def about
    #code
  end
end
