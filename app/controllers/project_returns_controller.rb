class ProjectReturnsController < ApplicationController
	def new
		@investment = Project.find(params[:id])
		@project_funding = ProjectFunding.where(investment_id: @investment.id)
		@project = @investment
		@user = @project_funding.first.user
		@return_annual = @project.new.calculate_return_annual
		@project_return = ProjectReturn.new(investment: @investment, user: @user)
		
	end

	def index 
		@projects = Project.where(state: 'completed')

	end

	def create

		@project_return = ProjectReturn.request(@user, @investment, @funding_offered, @return_annual, @return_daily, @return_percent)
	end


end
