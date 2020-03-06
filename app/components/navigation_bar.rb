class NavigationBar < LucidMaterial::Component::Base

  override_button_style = {
    root: {
      background: 'linear-gradient(45deg, #FE6B8B 30%, #FF8E53 90%)',
      borderRadius: 3,
      border: 0,
      color: 'white',
      height: 48,
      padding: '0 30px',
      boxShadow: '0 3px 5px 2px rgba(255, 105, 135, .3)',
    },
    label: {
      textTransform: 'capitalize',
    }
  }

  styles do |theme|
    {
      button_style: override_button_style,
      nav: {
        height: 70
      }
    }
  end

  render do
    Mui.Box(display: `{ xs: 'none', lg: 'block' }`) do
      NAV(class_name: styles.nav) do
        Mui.Button(class_name: styles.button_style, color: 'secondary', variant: 'contained', component: `Opal.global.Link`, to: '/docs') {"Documentation"}
        Mui.Button(color: 'secondary', variant: 'contained', component: 'span', href: 'https://twitter.com/isomorfeus') {MuiIcons.Twitter}
        Mui.Button(color: 'secondary', variant: 'contained', component: 'span', href: 'https://github.com/isomorfeus') {MuiIcons.GitHub}

        Mui.Button(color: 'secondary', variant: 'contained', component: `Opal.global.Link`, to: '/docs') {"Slack"}
        Mui.Button(color: 'secondary', variant: 'contained', component: 'span', href: 'https://shop.spreadshirt.de/isomorfeus-merchandise') {"Merchandise"}
      end
    end
  end
end




