class Footer < LucidMaterial::Component::Base
  styles do |theme|
    {
      links: { fontFamily: 'Questrial, sans-serif', fontSize: '1.5rem' },
      item: { marginBottom: '2rem' }
    }
  end
  render do
    Mui.Grid(container: true) do

      # 1. row
      Mui.Grid(class_name: styles.item, item: true, xs: 6, style: { textAlign: :center}) do
        # Mui.Link(class_name: styles.links, component: `Opal.global.Link`, color: :secondary, to: '/consulting') { 'Consulting, Training & Support' }
      end
      Mui.Grid(class_name: styles.item, item: true, xs: 6, style: { textAlign: :center}) do
        Mui.Link(class_name: styles.links, color: :secondary, href: 'https://twitter.com/isomorfeus') { MuiIcons.Twitter }
        # Mui.Link(class_name: styles.links, color: :secondary, href: 'https://twitter.com/isomorfeus') { MuiIcons.LinkedIn }
        # Mui.Link(class_name: styles.links, color: :secondary, href: 'https://twitter.com/isomorfeus') { 'Xing' }
      end

      # 2. row
      Mui.Grid(class_name: styles.item, item: true, xs: 6, sm: 3, style: { textAlign: :center}) do
        Mui.Link(class_name: styles.links, component: `Opal.global.Link`, color: :secondary, to: '/docs') { 'Documentation' }
      end
      Mui.Grid(class_name: styles.item, item: true, xs: 6, sm: 3, style: { textAlign: :center}) do
        Mui.Link(class_name: styles.links, color: :secondary, href: 'https://github.com/isomorfeus') { MuiIcons.GitHub }
      end
      Mui.Grid(class_name: styles.item, item: true, xs: 6, sm: 3, style: { textAlign: :center}) do
        Mui.Link(class_name: styles.links, component: `Opal.global.Link`, color: :secondary, to: '/slack') { 'Slack' }
      end
      Mui.Grid(class_name: styles.item, item: true, xs: 6, sm: 3, style: { textAlign: :center}) do
        Mui.Link(class_name: styles.links, color: :secondary, href: 'https://shop.spreadshirt.de/isomorfeus-merchandise') { 'Merchandise' }
      end
    end
  end
end
