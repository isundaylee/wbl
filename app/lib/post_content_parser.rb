class PostContentParser

  TEMPLATE_SUBHEAD = '<div class="subtitle"><h2>%s</h2></div>'
  TEMPLATE_PARAGRAPH = '<p>%s</p>'
  TEMPLATE_CONTAINER_BEGIN = '<div class="container post-container">'
  TEMPLATE_CONTAINER_END = '</div>'

  def initialize(content)
    @content = content
    @in_container = false
    @output = []
  end

  def parse!
    @doc = Nokogiri::HTML.fragment(@content)

    @doc.children.each(&method(:process_node))

    ensure_not_in_container

    @output.join.html_safe
  end

  def normalize_node(node)
    ['name', 'style', 'id', 'class'].each do |attr|
      node.delete(attr)
    end

    node.children.each(&method(:normalize_node))
  end

  def ensure_in_container
    if !@in_container
      @in_container = true
      @output << TEMPLATE_CONTAINER_BEGIN
    end
  end

  def ensure_not_in_container
    if @in_container
      @in_container = false
      @output << TEMPLATE_CONTAINER_END
    end
  end

  def process_node(node)
    # Looking for 'subheads', i.e., <span>s with font size 20px
    node.css('span').each do |s|
      if /20px/ =~ s['style']
        ensure_not_in_container
        @output << TEMPLATE_SUBHEAD % s.content
        return
      end
    end

    # Looking for actual <h2> 'subheads'
    if node.name.to_sym == :h2
      ensure_not_in_container
      @output << TEMPLATE_SUBHEAD % node.content
      return
    end

    # Recursively strips unnecessary attributes
    normalize_node(node)

    # Default behavior
    ensure_in_container
    @output << node.to_s
  end

end