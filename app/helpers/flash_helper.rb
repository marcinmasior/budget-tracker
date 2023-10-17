module FlashHelper
  def flash_bootstrap_class_for(flash_type)
    case flash_type.to_s
    when "notice" then "success"
    when "alert" then "danger"
    else flash_type.to_s
    end
  end
end
