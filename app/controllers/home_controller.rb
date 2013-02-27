class HomeController < ApplicationController

  def index
  	@project = Project.where(id: 29)
  end
end
