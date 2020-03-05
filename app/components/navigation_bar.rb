class NavigationBar < LucidMaterial::Component::Base
  styles do |theme|
    {
      nav: {
        height: 70
      }
    }
  end

  render do
    Mui.Box(display: { xs: 'none', lg: 'block' }.to_n) do
      NAV(class: styles.nav) do
        Mui.Button(color: 'primary', variant: 'contained', component: `Opal.global.Link`, to: '/docs') {"Documentation"}

      end
    end
  end
end




