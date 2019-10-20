class IsomorfeusWebsiteApp < LucidMaterial::App::Base
  theme do
    { root: { color: :black }}
  end

  render do
    Router(location: props.location) do
      Switch do
        Route(path: '/', exact: true, component: WelcomeComponent.JS[:react_component])
        Route(path: '/guides', component: Guides.JS[:react_component])
        Route(path: '/interactive_docs', exact: true, component: InteractiveDocs.JS[:react_component])
        Route(path: '/api_docs', exact: true, component: ApiDocs.JS[:react_component])
        Route(component: NotFound404Component.JS[:react_component])
      end
    end
  end
end
