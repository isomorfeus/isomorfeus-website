class NavigationBar < LucidMaterial::Component::Base


  styles do |theme|
    {
      button_margin: {
        margin: '10px 15px 10px 15px'
      },
      nav: {
        height: 70
      }
    }
  end



  render do
    start_icon = gre { MuiIcons.Delete }
    Mui.Box(display: `{ xs: 'none', lg: 'block' }`) do
      NAV(class_name: styles.nav) do
        Mui.Button(class_name: styles.button_margin, variant: 'contained', component: `Opal.global.Link`, to: '/docs', start_icon: start_icon) {"Documentation"}

        Mui.Button(class_name: styles.button_margin, variant: 'contained', component: `Opal.global.Link`, to: '/docs') {"Slack"}
        Mui.Button(class_name: styles.button_margin, variant: 'contained', component: 'span', href: 'https://shop.spreadshirt.de/isomorfeus-merchandise') {"Merchandise"}

        Mui.Button(class_name: styles.button_margin, variant: 'contained', component: 'span', href: 'https://twitter.com/isomorfeus') {MuiIcons.Twitter}
        Mui.Button(class_name: styles.button_margin, variant: 'contained', component: 'span', href: 'https://github.com/isomorfeus') {MuiIcons.GitHub}

      end
    end
  end
end




