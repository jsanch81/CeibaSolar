class GraphController < ApplicationController
    @datos = 0
  def post
    @datos = params[:key1]
  end
  def show
    
  end
end
