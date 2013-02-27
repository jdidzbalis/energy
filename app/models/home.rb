class Home < ActiveRecord::Base

attr_accessible :avatar, :project_name

has_one :project

end
