class LayoutComponent < LucidMaterial::Component::Base
  styles do |theme|
    { container: { backgroundColor: theme.palette.primary.main,
                   height: '100%',
                   minHeight: '100%' },
      footer: { backgroundColor: theme.palette.primary.main }
    }
  end

  render do
    component ||= Isomorfeus.cached_component_class(props.compo)
    props_h = props.to_h
    props_h.delete(:compo)
    DIV() do
      Header()
      Mui.Container(component: 'main', class_name: "main #{styles.container}") do
        rre(React.create_element(component, **props_h)) # DirectX
      end
      Mui.Container(class_name: styles.footer, max_width: false) do
        Footer()
      end
    end

  end
end
