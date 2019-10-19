class Enterprise < LucidMaterial::Component::Base
  preload do
    require_lazy('components/enterprise_loader').then do
      self.class.state.preloaded = true
    end
  end

  render do
    Enterprise::Header()
    DIV 'Work in progress ...'
    NavigationLinks()
  end

  while_loading do
    DIV 'Loading...'
  end
end

