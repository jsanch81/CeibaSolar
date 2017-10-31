class GraphController < ApplicationController
    @datos = 0
  def post
    @datos = params[0]
  end
  def show

  end
end
