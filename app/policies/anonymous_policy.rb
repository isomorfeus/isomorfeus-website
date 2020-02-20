class AnonymousPolicy < LucidPolicy::Base
  allow 'Document', :load
  deny others
end
