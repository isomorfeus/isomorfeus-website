class NavigationLinks < React::FunctionComponent::Base
  create_function do
    P do
      Link(to: '/') { 'Isomorfeus Home' }
      SPAN " | "
      Link(to: '/debugging_tools') { 'Debugging Tools' }
    end
  end
end
