class ProjectFundingsController < ApplicationController
	before_filter :authenticate_user!
	respond_to :html, :json


	def index
		@project_fundings = current_user.project_fundings.all		
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
					@project = @project_funding.investment
					@project.update_attribute(:funded, @project_funding.total_investment)
					@percent_funded = @project.funded * 100 / @project.project_cost
					@project.update_attribute(:percent_funded, @percent_funded)
					if @project.funded >= @project.project_cost
						@project.update_attribute(:state, 'completed')
					else
						@project.update_attribute(:state, 'inprogress')
					end
					redirect_to project_fundings_path(@investment)
			end	
		else
			flash[:notice] = "Project ID not found"
			redirect_to root_path
		end
	end
end
