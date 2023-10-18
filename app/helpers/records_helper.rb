module RecordsHelper

  def formatted_record_value(record)
    if record.income?
      content_tag(:span, "+ #{number_to_currency(record.value, unit: 'zł', format: "%n %u")}", class: "text-success")
    else
      content_tag(:span, "- #{number_to_currency(record.value, unit: 'zł', format: "%n %u")}", class: "text-danger")
    end
  end

end
