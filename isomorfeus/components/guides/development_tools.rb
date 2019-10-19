class Guides
  class DevelopmentTools < LucidMaterial::Component::Base
    styles do |theme|
      { heading: { color: theme.root.color }}
    end

    render do
      H3(class_name: styles.heading) { "Tools for developing Isomorfeus projects" }
      H4 "Opal Developer Tools"
      P {
        A(href: 'https://addons.mozilla.org/en-US/firefox/addon/opaldevtools/') { "For Firefox from addons.mozilla.org" }
        BR()
        A(href: 'https://chrome.google.com/webstore/detail/opaldevelopertools/lbodjejiiaanfdajbegggpomgogfhahj') { "For Chrome from Google Webstore" }
      }
      H4 "React Developer Tools"
      P {
        A(href: 'https://addons.mozilla.org/en-US/firefox/addon/react-devtools/') { "For Firefox from addons.mozilla.org" }
        BR()
        A(href: 'https://chrome.google.com/webstore/detail/react-developer-tools/fmkadmapgofadopljbjfkapdkoienihi') { "For Chrome from Google Webstore" }
      }
      H4 "Redux Developer Tools"
      P {
        A(href: 'https://addons.mozilla.org/en-US/firefox/addon/reduxdevtools/') { "For Firefox from addons.mozilla.org" }
        BR()
        A(href: 'https://chrome.google.com/webstore/detail/redux-devtools/lmhkpmbekcpmknklioeibfkpmmfibljd') { "For Chrome from Google Webstore" }
      }
    end
  end
end
