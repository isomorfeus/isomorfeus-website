class Enterprise < LucidMaterial::Component::Base
  preload do
    require_lazy('components/enterprise_loader').then do
      self.class.state.preloaded = true
    end
  end

  while_loading :except_ssr do
    DIV 'Loading...'
  end

  render do
    Enterprise::Header()
    DIV 'Work in progress ... .'
    NavigationLinks()
  end
end
