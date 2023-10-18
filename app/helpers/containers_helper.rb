module ContainersHelper

  def formatted_balance(balance)
    if balance >= 0
      content_tag(:span, "+ #{number_to_currency(balance, unit: 'zł', format: "%n %u")}", class: "text-success")
    else
      content_tag(:span, "- #{number_to_currency(balance.abs, unit: 'zł', format: "%n %u")}", class: "text-danger")
    end
  end

end
