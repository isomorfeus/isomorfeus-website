module Guides
  class Main < LucidMaterial::Component::Base
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
end
