module Shared
  class AppBar < LucidMaterial::Component::Base
    styles do |theme|
     { title: { color: theme.palette.secondary.main, paddingLeft: '10px' }}
    end

    render do
      Mui.AppBar(position: :fixed, color: :default) do
        Mui.Toolbar do
          Mui.Link(component: `Opal.global.Link`, to: '/') { Logo(size: '33px') }
          Mui.Link(component: `Opal.global.Link`, to: '/') do
            Mui.Typography(class_name: styles.title) { "ISOMORFEUS" }
          end
        end
      end
    end
  end
end
