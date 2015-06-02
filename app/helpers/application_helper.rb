module ApplicationHelper
  def nav_item(title, url, active, &block)
    if block
      dropdown = content_tag(:ul, {class: 'dropdown'}) do
        capture(&block)
      end
    end

    content_tag(:li, {class: active ? 'active' : ''}) do
      concat link_to(title, url)
      concat dropdown
    end
  end
end
