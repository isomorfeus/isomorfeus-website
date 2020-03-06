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
                              contrastText: '#ffffff' },
                   info: { main: '#05adb8'},
                   success: { main: '#f9f292'}},
        typography: { fontFamily: 'Questrial, sans-serif',
                      h1: { fontFamily: 'Questrial, sans-serif', color: '#0b6174' },
                      h4: { fontFamily: 'Questrial, sans-serif', color: '#0b6174' }},
        # this does not work for some reason
        # overrides: { MuiCssBaseline: { '@global': { '@font-face': { fontFamily: 'Questrial', src:  "local('Questrial Regular '), local('Questrial-Regualr'), url(http://localhost:3035/assets/d7cfa042f25e95e221f73fa59e7d4a9d.woff2) format('woff2'), url(http://localhost:3035/assets/b0b3f17e6840538fe0c5309e2b96f329.woff) format('woff')" }}}}
      })
  end

  render do
    Router(location: props.location) do
      Switch do

        # We use one outer component for the layout, we pass the inner component to render as prop
        # the component_fun helper here is total fun as it allows us to do so

        Route(path: '/', exact: true, render: component_fun('LayoutComponent', compo: 'WelcomeComponent'))
        Route(path: '/consulting', exact: true, render: component_fun('LayoutComponent', compo: 'ConsultingPage'))
        Route(path: '/docs/:document+', exact: true, render: component_fun('LayoutComponent', compo: 'Docs::DocumentPage'))
        Route(path: '/docs', exact: true, render: component_fun('LayoutComponent', compo: 'Docs::Main'))
        Route(path: '/guides', exact: true, render: component_fun('LayoutComponent', compo: 'Guides::Main'))
        Route(path: '/merchandise', exact: true, render: component_fun('LayoutComponent', compo: 'MerchandisePage'))
        Route(path: '/packages', exact: true, render: component_fun('LayoutComponent', compo: 'PackagesPage'))
        Route(path: '/slack', exact: true, render: component_fun('LayoutComponent', compo: 'SlackPage'))

        Route(path: '/about', exact: true, render: component_fun('LayoutComponent', compo: 'AboutPage'))
        Route(path: '/imprint', exact: true, render: component_fun('LayoutComponent', compo: 'ImprintPage'))

        Route(render: component_fun('LayoutComponent', compo: 'NotFound404Component'))
      end
    end
  end
end
