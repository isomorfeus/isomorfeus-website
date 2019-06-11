class IsomorfeusWebsiteApp < LucidMaterial::App::Base
  render do
    Router(location: props.location) do
      Switch do
        Route(path: '/', exact: true, component: WelcomeComponent.JS[:react_component])
      end
    end
  end
end