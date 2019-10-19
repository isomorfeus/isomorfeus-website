class Consulting < LucidMaterial::Component::Base
  preload do
    require_lazy('components/consulting_loader').then do
      self.class.state.preloaded = true
    end
  end

  render do
    Consulting::Header()
    DIV 'Work in progress ...'
    NavigationLinks()
  end

  while_loading do
    DIV 'Loading...'
  end
end
