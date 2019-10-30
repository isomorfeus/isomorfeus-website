class IsomorfeusWebsiteApp < LucidMaterial::App::Base
  theme do |default_theme|
    default_theme.deep_merge(
      { palette: { primary: { main: '#cccccc',
                              light: '#ffffff',
                              dark: '#9b9b9b',
                              contrastText: '#3f3e36' },
                 secondary: { main: '#0b6174',
                              light: '#498fa3',
                              dark: '#003748',
                              contrastText: '#ffffff' }}})
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
