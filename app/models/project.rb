class Project < ActiveRecord::Base
  attr_accessible :project_cost, :project_name, :project_cost, :percent_funded, :funded

has_many :project_fundings

end
