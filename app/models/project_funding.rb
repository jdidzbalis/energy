class ProjectFunding < ActiveRecord::Base
  belongs_to :user
  belongs_to :investment, class_name: 'Project', foreign_key: 'investment_id'

  attr_accessible :user, :investment, :user_id, :investment_id, :funding_offered, :project_name


	def self.request(user1, project1, funding)
		transaction do
			funding1 = create!(user: user1, investment: project1, funding_offered: funding)
			funding1
		end
	end

	 def total_investment
    ProjectFunding.where(investment_id: investment_id).sum(:funding_offered)
    end

 




end
