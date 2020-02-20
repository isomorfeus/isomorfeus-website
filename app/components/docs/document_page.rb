module Docs
  class DocumentPage < LucidMaterial::Component::Base
    preload do
      @doc = Document.new(key: props.match[:params][:document])
      if @doc.loaded?
        Promise.new.resolve
      else
        Document.promise_load(key: props.match[:params][:document]).then do |doc|
          @doc = doc
        end
      end
    end

    render do
      markdown = @doc&.markdown
      markdown = '' unless markdown
      ReactMarkdown(source: markdown)
    end
  end
end
