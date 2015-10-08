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

  def make_paragraphs(text, html_options = {})
    safe_join(text.lines.map { |l| l.presence && content_tag(:p, l, html_options) })
  end
end
