class Javadoc < Liquid::Tag

  def initialize(tagName, content, tokens)
    super
    @content = content
  end

  def render(context)
    path = "#{context[@content.strip]}"
    clazz = path.gsub('/', '.')
    "<a href=\"https://www.yamcs.org/yamcs/javadoc/index.html?#{path}.html\"><tt>#{clazz}</tt></a>"
  end

  Liquid::Template.register_tag 'javadoc', self
end
