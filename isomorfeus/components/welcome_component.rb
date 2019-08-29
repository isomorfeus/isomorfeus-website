class WelcomeComponent < LucidMaterial::Component::Base
  styles do |theme|
    { heading: { color: theme.root.color }}
  end

  render do
    H3(class_name: styles.heading) { "Welcome to the Isomorfeus Framework" }
    DIV "Until we polished the website please have a look at:"
    BR()
    A(href: 'https://github.com/isomorfeus/') { 'The Isomorfeus Framework at Github' }
    BR()
    BR()
    A(href: 'https://join.slack.com/t/isomorfeus/shared_invite/enQtNjQzMDMzMTM2ODIzLWU1ZDBlZmE2MjMxMmY1YmY4MmZiYzY5MTU0NTc3OTNhMTgzY2M2YWQwZGNhZDczMjlkNGMwZWI2YmRhMjkyZjY') { "Join our Isomorfeus Slack space" }
    SPAN " or "
    A(href: 'https://gitter.im/isomorfeus/Lobby') { "our Gitter chat room" }
    BR()
    H4 "Getting started:"
    PRE <<~TEXT
      $ gem install isomorfeus-installer -v 1.0.0.zeta4
      $ isomorfeus new my_project
      $ cd my_project
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
    DIV "------------"
  end
end