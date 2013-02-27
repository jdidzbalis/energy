class ProjectReturn < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :user, :investment, :funding_offered, :investment_id, :user_id

  belongs_to :user
  belongs_to :investment, class_name: 'Project', foreign_key: 'investment_id'

	def calculate_return_annual
		Project.where(id: investment_id)
	end


end
