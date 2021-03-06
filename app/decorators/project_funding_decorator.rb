class ProjectFundingDecorator < Draper::Decorator
  delegate_all

   def investment_state
    model.state.titleize
  end

  def sub_message
   	case model.state
    when 'pending'
      "Do you really want to invest in #{model.investment.id}?"
    when 'accepted'
      "You have invested in #{model.investment.id}."
    end
  end

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       source.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

end
