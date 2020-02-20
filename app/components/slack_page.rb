class SlackPage < LucidMaterial::Component::Base
  render do
    A(href: 'https://join.slack.com/t/isomorfeus/shared_invite/enQtNjQzMDMzMTM2ODIzLWFkM2EwNTM1Yjk2YzE1Mzg1YTFhNWI1NzYxMDY1MTQ5ODZiMDg1MGRkMDA1NjM5ZWU4NjMwYTUyOTNhMTg5MzE', rel: "nofollow") { "Join our Isomorfeus Slack space" }
    BR()
    SPAN " or "
    BR()
    A(href: 'https://isomorfeus.slack.com') { 'Login to isomorfeus.slack.com' }
    BR()
  end
end
