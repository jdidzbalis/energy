class ProjectFundingsController < ApplicationController
	before_filter :authenticate_user!
	respond_to :html, :json

	

	def index
		if current_user.try(:admin?)
			@project_fundings = ProjectFunding.all
		else
			@project_fundings = current_user.project_fundings.all
		end
	end

	def accept
		@project_funding = ProjectFunding.find(params[:id])

		if @project_funding.accept!
			@project = @project_funding.investment
			@project.update_attribute(:funded, @project_funding.total_investment)
			flash[:notice] = "Investment accepted"
		else
			flash[:notice] = "Investment not accepted"
			redirect_to project_fundings_path
		end

	end

	def new
		if params[:investment_id]
			@investment = Project.find(params[:investment_id])
			@funding_offered = params[:funding_level]
			@project_funding = current_user.project_fundings.new(investment: @investment, funding_offered: @funding_offered)

			
			flash[:notice] = @funding_offered
		else
			flash[:notice] = "Project required..."
		end
		rescue ActiveRecord::RecordNotFound
		render file: 'public/404', status: :not_found
	end

	def create
		if params[:project_funding] && params[:project_funding].has_key?(:investment_id)
			@investment = Project.find(params[:project_funding][:investment_id])
			@funding_offered = params[:project_funding][:funding_level]
			@project_funding = ProjectFunding.request(current_user, @investment, @funding_offered)
			if @project_funding.new_record?			
				flash[:notice] = "There was a problem creating the investment request"
				redirect_to project_path(@investment)
			else
				flash[:notice] = @funding_offered
				redirect_to project_path(@investment)
			end	
		else
			flash[:notice] = "Project ID not found"
			redirect_to root_path
		end
	end
end
