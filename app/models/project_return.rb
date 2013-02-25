class ProjectReturn < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :user
  belongs_to :investment, class_name: 'Project', foreign_key: 'investment_id'

end
