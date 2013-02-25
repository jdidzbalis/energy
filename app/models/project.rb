class Project < ActiveRecord::Base
  attr_accessible :avatar, :project_name, :project_owner, :project_location, :project_opdate,
  				:project_cost, :project_esavings, :project_csavings, :project_allocation, :percent_funded, :funded,
  				:fundinglevel1, :fundinglevel2, :fundinglevel3, :fundinglevel4, :fundinglevel5, :y1_savings, :y2_savings

has_many :project_fundings
has_many :investments, :through => :project_fundings
has_attached_file :avatar, :styles => { :large => "940x600#", :medium => "300x200>", :small => "200x200>" },
		:path => ":rails_root/public/system/:attachment/:id/:style/:filename",
      	:url => "/system/:attachment/:id/:style/:filename"

state_machine :state, initial: :inprogress do
  	after_transition on: :complete, do: [:total_investment]

  	state :requested

  	event :complete do
  		transition any => :completed
    end
  end

  def send_request_email
		InvestmentNotifier.investment_requested(id).deliver
	end

	def send_acceptance_email
		InvestmentNotifier.investment_request_accepted(id).deliver
	end

  def mutual_investment
    self.class.where({user_id: user_id, investment_id: investment_id}).first
  end

  def accept_mutual_investment!
    #Grab the investment and update the state without using the state machine
    mutual_investment.update_attribute(:state, 'accepted')
  end

   def total_investment
    ProjectFunding.where(investment_id: investment_id).sum(:funding_offered)
  	end

def calculate_savings_per
	y1_savings.to_f / project_cost

end


end
