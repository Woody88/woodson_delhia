module ApplicationHelper

  def controller_assets
    controller = params[:controller]
    
    if Rails.application.config.x.controller_with_assets.include? controller
      javascript_include_tag("#{controller}/#{controller}", 'data-turbolinks-track' => true)  + stylesheet_link_tag(controller, 'data-turbolinks-track' => true)
    end
  end
  
end
