class IsomorfeusWebsiteApp < LucidMaterial::App::Base
  theme do
    { root: { color: :black }}
  end

  render do
    Router(location: props.location) do
      Switch do
        Route(path: '/', exact: true, component: WelcomeComponent.JS[:react_component])
        Route(path: '/development_tools', exact: true, component: DevelopmentTools.JS[:react_component])
        Route(component: NotFound404Component.JS[:react_component])
      end
    end
  end
end
