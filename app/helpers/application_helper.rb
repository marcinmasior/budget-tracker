module ApplicationHelper

  def formatted_value(value)
    number_to_currency(value, unit: 'zł', format: "%n %u", precision: 2)
  end

end
