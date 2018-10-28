module Jekyll
    module Tags
      class HintBlock < Liquid::Block

        def initialize(tag_name, markup, tokens)
          super
        end

        def render(context)
          site = context.registers[:site]
          converter = site.find_converter_instance(::Jekyll::Converters::Markdown)

          marked = converter.convert(super(context))
          template = Liquid::Template.parse(marked)
          rendered = template.render(context)
          "<div class=\"hint\">#{rendered}</div>"
        end
      end
    end
  end
  
  Liquid::Template.register_tag('hint', Jekyll::Tags::HintBlock)
