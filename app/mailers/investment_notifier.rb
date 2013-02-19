class InvestmentNotifier < ActionMailer::Base
  default from: "from@example.com"

  def investment_requested(project_funding_id)
  	project_funding = ProjectFunding.find(project_funding_id)

  	@user = project_funding.user
  	@investment = project_funding.investment

  	mail to: @user.email,
  		subject: "#{@user.first_name} as user your request to invest in #{@investment.project_name} has been submitted for approval."
  end

def investment_request_accepted(project_funding_id)
  	project_funding = ProjectFunding.find(project_funding_id)

  	@user = project_funding.user
  	@investment = project_funding.investment

  	mail to: @user.email,
      subject: "#{@user.first_name} your investment in #{@investment.project_name} has been approved."
  end


end
