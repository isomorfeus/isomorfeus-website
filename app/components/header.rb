class Header < LucidMaterial::Component::Base
  styles do |theme|
    {
      appbar: {
        backgroundColor: theme.palette.info.main
      },
      grow: {
        flexGrow: 1
      }
    }
  end
  render do
    Mui.AppBar(position: "fixed", color:"inherit", class_name: styles.appbar) do
      Mui.Toolbar(id: 'app-header') do
        # NavigationMobile()
        DIV(class: styles.grow) {}
        NavigationBar()
        DIV(class: styles.grow) {}

      end

    end
  end
end




