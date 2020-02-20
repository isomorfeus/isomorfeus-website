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
    props_h = Hash.new(props.to_n) # a bug in isomorfeus-react
    props_h.delete(:compo)
    Mui.Container(class_name: styles.container, max_width: false) do
      rre(React.create_element(component, **props_h)) # DirectX
    end
    Mui.Container(class_name: styles.footer, max_width: false) do
      Footer()
    end
  end
end
