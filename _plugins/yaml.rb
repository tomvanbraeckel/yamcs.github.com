module Jekyll
    module Tags
      class YamlBlock < Jekyll::Tags::HighlightBlock

        def initialize(tag_name, markup, tokens)
          super(tag_name, 'yaml', tokens)
          @header = markup or ''
        end

        def render(context)
          rendered = super
          if not @header.empty? then
            rendered = "<pre class=\"r header\">#{@header}</pre>" + rendered
          end
          rendered
        end
      end
    end
  end
  
  Liquid::Template.register_tag('yaml', Jekyll::Tags::YamlBlock)
