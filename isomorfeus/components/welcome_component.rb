class WelcomeComponent < LucidComponent::Base
  render do
    H3 "Welcome to the Isomorfeus Framework"
    DIV "For the moment see:"
    BR()
    Link(to: 'https://github.com/isomorfeus/') { 'The Isomorfeus Framework at Github' }
    BR()
    BR()
    Link(to: 'https://join.slack.com/t/isomorfeus/shared_invite/enQtNjQzMDMzMTM2ODIzLWU1ZDBlZmE2MjMxMmY1YmY4MmZiYzY5MTU0NTc3OTNhMTgzY2M2YWQwZGNhZDczMjlkNGMwZWI2YmRhMjkyZjY') { "Join our Isomorfeus Slack space here" }
    SPAN " or "
    Link(to: 'https://join.slack.com/t/isomorfeus/shared_invite/enQtNjQzMDMzMTM2ODIzLWU1ZDBlZmE2MjMxMmY1YmY4MmZiYzY5MTU0NTc3OTNhMTgzY2M2YWQwZGNhZDczMjlkNGMwZWI2YmRhMjkyZjY') { "our Gitter chat room here" }
  end
end