class Guides < LucidMaterial::Component::Base
  if on_browser?
    preload do
      require_lazy('components/guides_loader').then do
        self.class.state.preloaded = true
      end
    end

    while_loading do
      DIV 'Loading...'
    end
  end

  render do
    Guides::Header()
    Switch do
      Route(path: "#{props.match.path}/development_tools", exact: true, component: Guides::DevelopmentTools.JS[:react_component])
      Route(path: props.match.path, exact: true) do
        UL do
          LI { Link(to:"#{props.match.url}/development_tools") { 'Development Tools' } }
        end
      end
    end
    NavigationLinks()
  end
end
