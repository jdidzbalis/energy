class Project < ActiveRecord::Base
  attr_accessible :avatar, :project_cost, :project_name, :project_cost, :percent_funded, :funded

has_many :funding_offered, :through => :project_fundings
has_attached_file :avatar, :styles => { :large => "940x600>", :medium => "300x200>", :small => "200x200>" },
		:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      	:url => "/system/:attachment/:id/:style/:filename"


end
