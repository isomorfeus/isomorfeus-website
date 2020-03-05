class WelcomeComponent < LucidMaterial::Component::Base
  state.power = :empower

  styles do
    { item: { marginBottom: '4rem' }}
  end

  component_did_mount do
    # temporary, need to add it to Kernel
    after(5000) do
      state.power = :iso
    end
  end

  render do
    Mui.Grid(container: true, align_content: :center, align_items: :center) do
      Mui.Grid(class_name: styles.item, item: true, xs: 12) do
        Mui.Typography(variant: 'h1', style: { textAlign: :center, marginTop: '4rem' }) do
          if state.power == :empower
            Fragment 'EMP'
            Logo(size: '6rem')
            Fragment 'WERMENT'
          else
            Fragment 'ISOM'
            Logo(size: '6rem')
            Fragment 'RFEUS'
          end
        end
      end
      Mui.Grid(class_name: styles.item, item: true, xs: 12) do
        Mui.Typography(variant: 'h4', style: { textAlign: :center }) do
          Fragment "Create full stack isomorphic applications"
          BR()
          Fragment "for web, mobile and desktop"
        end
      end
      Mui.Grid(class_name: styles.item, item: true, xs: 12, style: { textAlign: :center }) do
        Mui.Button(variant: :outlined, component: `Opal.global.Link`, to: '/docs/project/get_started_web') { 'Get Started!' }
      end
    end
  end
end
