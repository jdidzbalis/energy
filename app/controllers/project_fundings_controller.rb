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
			@percent_funded = @project.funded / @project.project_cost * 100
				if @percent_funded == nil
					@percent_funded = 0
					@project.update_attribute(:percent_funded, @percent_funded)
					
				else
					@project.update_attribute(:percent_funded, @percent_funded)
				end
			
			flash[:notice] = "Investment Approved"
			redirect_to project_fundings_path
		else
			redirect_to project_fundings_path
		end

	end

	def new
		if params[:investment_id]
			@investment = Project.find(params[:investment_id])
			@funding_offered = params[:funding_level]
			@project_funding = current_user.project_fundings.new(investment: @investment, funding_offered: @funding_offered)
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
				flash[:notice] = "There was a problem. We could not find the project. Please contact us at support@energy.com"
				redirect_to project_path(@investment)
			else
				flash[:notice] = "Your investment has been requested, and will be pending until project is fully funded. Track all of your investments here."
				redirect_to project_fundings_path(@investment)
			end	
		else
			flash[:notice] = "Project ID not found"
			redirect_to root_path
		end
	end
end
