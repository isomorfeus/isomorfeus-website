class NavigationBar < LucidMaterial::Component::Base
  styles do |theme|
    {
      nav: {
        height: 70
      }
    }
  end

  render do
    Mui.Box(display: `{ xs: 'none', lg: 'block' }`) do
      NAV(class: styles.nav) do
        Mui.Button(color: 'secondary', variant: 'contained', component: `Opal.global.Link`, to: '/docs') {"Documentation"}
        Mui.Button(color: 'secondary', variant: 'contained', component: 'span', href: 'https://twitter.com/isomorfeus') {MuiIcons.Twitter}
        Mui.Button(color: 'secondary', variant: 'contained', component: 'span', href: 'https://github.com/isomorfeus') {MuiIcons.GitHub}

        Mui.Button(color: 'secondary', variant: 'contained', component: `Opal.global.Link`, to: '/docs') {"Slack"}
        Mui.Button(color: 'secondary', variant: 'contained', component: 'span', href: 'https://shop.spreadshirt.de/isomorfeus-merchandise') {"Merchandise"}
      end
    end
  end
end




