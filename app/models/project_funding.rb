class ProjectFunding < ActiveRecord::Base
  belongs_to :user
  belongs_to :investment, class_name: 'Project', foreign_key: 'investment_id'

  attr_accessible :user, :investment, :user_id, :investment_id, :state, :funding_offered

  state_machine :state, initial: :pending do
  	after_transition on: :accept, do: [:send_acceptance_email, :accept_mutual_investment!, :total_investment]

  	state :requested

  	event :accept do
  		transition any => :accepted
    end
  end

	def self.request(user1, project1, funding)
		transaction do
			funding1 = create!(user: user1, investment: project1, funding_offered: funding, state: 'pending')
			funding1.send_request_email
			funding1
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
    ProjectFunding.where({investment_id: investment_id, state: 'accepted'}).sum(:funding_offered)
  end



end
