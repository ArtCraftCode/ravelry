module Ravelry
  # There is no API access point for UserSite. The information used to create `Ravelry::UserSite` comes from other objects.
  # 
  # You should not create `UserSite` objects manually; they are all created–and owned by–other objects.
  # 
  # This does not inherit from {Ravelry::Data} because it doesn't have a corresponding API endpoint.
  # 
  class UserSite
    attr_reader :id, :social_site, :url, :username

    # Creates new `UserSite` from Ravelry API attributes.
    # 
    # All class variables are readonly.
    # 
    def initialize(user_site)
      @id = user_site[:id]
      @social_site = SocialSite.new(user_site[:social_site])
      @url = user_site[:url]
      @username = user_site[:username]
    end    
  end
end