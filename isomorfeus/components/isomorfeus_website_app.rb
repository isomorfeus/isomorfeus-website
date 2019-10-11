class IsomorfeusWebsiteApp < LucidMaterial::App::Base
  theme do
    { root: { color: :black }}
  end

  render do
    Router(location: props.location) do
      Switch do
        Route(path: '/', exact: true, component: WelcomeComponent.JS[:react_component])
        Route(path: '/debugging_tools', exact: true, component: DebuggingTools.JS[:react_component])
        Route(component: NotFound404Component.JS[:react_component])
      end
    end
  end
end
