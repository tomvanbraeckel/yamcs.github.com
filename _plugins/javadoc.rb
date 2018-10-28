class Javadoc < Liquid::Tag

  def initialize(tagName, args, tokens)
    super
    @path = args
    @path.strip!
  end

  def render(context)
    clazz = @path.gsub('/', '.')
    "<a href=\"https://www.yamcs.org/yamcs/javadoc/index.html?#{@path}.html\"><tt>#{clazz}</tt></a>"
  end

  Liquid::Template.register_tag 'javadoc', self
end
