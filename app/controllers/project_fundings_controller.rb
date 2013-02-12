class ProjectFundingsController < ApplicationController
	before_filter :authenticate_user!, only: [:new, :create]

	def new
		if params[:investment_id]
			@investment = Project.find(params[:investment_id])
			@project_funding = current_user.project_fundings.new(investment: @investment)
			flash[:notice] = "Project ID #{@investment.id}"
		else
			flash[:notice] = "Project required..."
		end
		rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end

	def create
		if params[:project_funding].has_key?(:investment_id)
			@investment = Project.find(params[:project_funding][:investment_id])
			@project_funding = current_user.project_fundings.new(investment: @investment)
			if @project_funding.save
				flash[:notice] = "You have invested in #{@project.project_name}"
			else
				flash[:notice] = "Project required"
			redirect_to profile_path(@project)
			end
		else
			flash[:notice] = "Project ID not found"
			redirect_to root_path
		end
	end
end
