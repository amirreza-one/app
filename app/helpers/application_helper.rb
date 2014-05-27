module ApplicationHelper
  def resource_name
    :user
  end

  def resource
    @resource ||= User.new
  end

  def devise_mapping
    @devise_mapping ||= Devise.mappings[:user]
  end

  def flash_class(level)
    case level
      when :notice then "alert alert-info"
      when :success then "alert alert-success"
      when :error then "alert alert-error"
      when :alert then "alert alert-error"
    end
  end

  def sortable(column , title=nil)
    title||= column.titleize
    css_class = column == sort_column ? "current #{sort_direction}" : nil?
    direction = column == sort_column && sort_direction =="asc" ? "desc" : "asc"
    link_to title , params.merge(:sort => column , :direction => direction ,:page => nil), class: css_class

  end

  def date_depend_on_language(date)
    if I18n.locale == :fa
      return JalaliDate.to_jalali(date).strftime("%d %B %Y (%A)")
    else
      return date.strftime(" %d %b %Y (%a)")
    end
  end



end
