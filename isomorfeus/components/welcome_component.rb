class WelcomeComponent < LucidMaterial::Component::Base
  styles do |theme|
    { heading: { color: theme.root.color }}
  end

  render do
    H3(class_name: styles.heading) { "Welcome to the Isomorfeus Project" }
    DIV "The powerful, isomorphic full stack Ruby web application development environment."
    DIV "Until we polished the website please have a look at:"
    BR()
    A(href: 'https://github.com/isomorfeus/') { 'The Isomorfeus Project at Github' }
    BR()
    BR()
    A(href: 'http://twitter.com/isomorfeus') { 'Follow the Isomorfeus Project on Twitter' }
    BR()
    BR()
    A(href: 'https://join.slack.com/t/isomorfeus/shared_invite/enQtNjQzMDMzMTM2ODIzLWFkM2EwNTM1Yjk2YzE1Mzg1YTFhNWI1NzYxMDY1MTQ5ODZiMDg1MGRkMDA1NjM5ZWU4NjMwYTUyOTNhMTg5MzE', rel: "nofollow") { "Join our Isomorfeus Slack space" }
    SPAN " or "
    A(href: 'https://gitter.im/isomorfeus/') { "our Gitter space" }
    BR()
    PRE <<~TEXT
      Available channels (mirrored):
      Slack                <---> Gitter
      ----------------------------------------------------------
      #arango_driver       <---> isomorfeus/arango_driver
      #ci                  <---> isomorfeus/ci     (ci notifications)
      #opal_devtools       <---> isomorfeus/opal_devtools
      #opal_webpack_loader <---> isomorfeus/opal_webpack_loader
      #repo_notifications  <---> isomorfeus/repo_notifications
      #ruby_framework      <---> isomorfeus/Lobby  (main isomorfeus channel)
    TEXT
    BR()
    H4 "Getting started:"
    PRE <<~TEXT
      $ gem install isomorfeus-installer -v 1.0.0.zeta5
      $ isomorfeus new my_project
      $ cd my_project
      $ bundle install
      $ foreman start
    TEXT
    P do
      SPAN "Then open browser at "
      A(href: 'http://localhost:5000') { "http://localhost:5000" }
      SPAN "."
      BR()
      SPAN "Open editor, components are in my_project/isomorfeus/components, and start coding!"
      BR()
      SPAN "(For foreman: gem install foreman.)"
    end
    P do
      SPAN "See available "; Link(to: '/development_tools') { 'Development Tools' }
    end
    P do
      SPAN { A(href: "/debug_guide", rel: "nofollow") { "A Debug Guide" }}
      SPAN " (not finished yet, but good page to try all features of Opal Developer Tools) (Loads large assets, source maps, etc.)"
    end
    NavigationLinks()
  end
end
