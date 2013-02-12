class ProjectFundingsController < ApplicationController
	before_filter :authenticate_user!, only: [:new]

	def new
		if params[:project_id]
			@project = Project.find(params[:project_id])
			@project_fundings = current_user.project_fundings.new(project: @project)

		else
			flash[:error] = "Project required"
		end
	rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end

	def create
	if params[:project_id]
		@project = Project.find(params[:project_id])
		@project_fundings = current_user.project_fundings.new(project: @project)
		if @project_fundings.save
			flash[:success] = "You have invested in #{@project.project_name}"
		else
			flash[:error] = "Project required"
		redirect_to profile_path(@project)
		end
	else
		flash[:error] = "Project ID not found"
		redirect_to root_path
	end
end
end
