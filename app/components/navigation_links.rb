class NavigationLinks < React::FunctionComponent::Base
  render do
    P do
      Link(to: '/') { 'Isomorfeus Home' }
      SPAN " | "
      Link(to: '/guides') { 'Guides' }
      SPAN " | "
      Link(to: '/interactive_docs') { 'Interactive Docs' }
      SPAN " | "
      Link(to: '/api_docs') { 'API Docs' }
    end
  end
end
