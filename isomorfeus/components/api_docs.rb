class ApiDocs < LucidMaterial::Component::Base
  if on_browser?
    preload do
      require_lazy('components/api_docs_loader').then do
        self.class.state.preloaded = true
      end
    end

    while_loading do
      DIV 'Loading...'
    end
  end

  render do
    ApiDocs::Header()
    DIV 'Work in progress ...'
    NavigationLinks()
  end
end
