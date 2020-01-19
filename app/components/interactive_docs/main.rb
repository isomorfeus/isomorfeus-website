module InteractiveDocs
  include React::Component::Resolution

  class Main < LucidMaterial::Component::Base
    preload do
      require_lazy('../interactive_docs_loader').then do
        self.class.state.preloaded = true
      end
    end

    while_loading :except_ssr do
      DIV 'Loading...'
    end

    render do
      InteractiveDocs::Header()
      DIV 'Work in progress ...'
      NavigationLinks()
    end
  end
end
