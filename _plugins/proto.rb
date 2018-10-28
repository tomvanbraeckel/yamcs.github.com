module Jekyll
    module Tags
      class ProtoBlock < Jekyll::Tags::HighlightBlock

        def initialize(tag_name, markup, tokens)
          super(tag_name, 'proto', tokens)
          @header = markup or ''
          @link_root = 'https://github.com/yamcs/yamcs/blob/master/yamcs-api/src/main/proto/yamcs/protobuf'
        end

        def render(context)
          rendered = super
          if not @header.empty? then
            rendered = "<pre class=\"r header\"><a href=\"#{@link_root}/#{@header}\">#{@header}</a></pre>" + rendered
          end
          rendered
        end
      end
    end
  end
  
  Liquid::Template.register_tag('proto', Jekyll::Tags::ProtoBlock)
