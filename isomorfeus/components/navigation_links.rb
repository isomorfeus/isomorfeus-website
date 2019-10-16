class NavigationLinks < React::FunctionComponent::Base
  create_function do
    P do
      Link(to: '/') { 'Isomorfeus Home' }
      SPAN " | "
      Link(to: '/development_tools') { 'Development Tools' }
    end
  end
end
