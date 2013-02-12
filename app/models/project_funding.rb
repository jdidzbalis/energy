class ProjectFunding < ActiveRecord::Base
  belongs_to :user
  belongs_to :investment, class_name: 'Project', foreign_key: 'investment_id'

  attr_accessible :user, :investment, :user_id, :investment_id

end
