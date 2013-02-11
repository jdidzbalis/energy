class ProjectFunding < ActiveRecord::Base
  belongs_to :user
  belongs_to :project

  attr_accessible :user, :project, :user_id, :project_id

end
