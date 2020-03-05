class Header < LucidMaterial::Component::Base
  styles do |theme|
    {
      grow: {
        flexGrow: 1
      }
    }
  end
  render do
    Mui.AppBar(position: "fixed", color:"inherit") do
      Mui.Toolbar(id: 'app-header') do
        # NavigationMobile()
        DIV(class: styles.grow) {}
        NavigationBar()
        DIV(class: styles.grow) {}

      end

    end
  end
end




