module ApplicationHelper

  def full_title page_title
    base_title = t "logo"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def display_star rate
    count = Settings._0
    html = ""
    while count < rate.to_i
      html << Settings._star
      count += Settings._1
    end
    render html: html.html_safe
  end

  def display_no_star rate
    count = Settings._0
    html = ""
    no_rate = Settings._5 - rate
    while count < no_rate.to_i
      html << Settings._no_star
      count += Settings._1
    end
    render html: html.html_safe
  end

end
