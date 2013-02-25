class ProjectReturnsController < ApplicationController
	def new
		@project = Project.find(params[:investment_id])
		
	end

	def index 
		@project_fundings = ProjectFunding.all
	end

	def create
		flash[:notice] = "Repayment updated"
		redirect_to admin_project_returns_path
	end


end
