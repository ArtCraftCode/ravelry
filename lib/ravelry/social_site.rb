module Ravelry
  # There is no API access point for PatternAuthors. The information used to create `Ravelry::SocialSite` comes from other objects.
  # 
  # You should not create `Author` objects manually; they are all created–and owned by–other objects.
  # 
  # This does not inherit from {Ravelry::Data} because it doesn't have a corresponding API endpoint.
  # 
  class SocialSite
    attr_reader :id, :active, :favicon_url, :name

    # Creates new `SocialSite` from Ravelry API attributes.
    # 
    # All class variables are readonly.
    # 
    def initialize(social_site)
      @id = social_site[:id]
      @active = social_site[:active]
      @favicon_url = social_site[:favicon_url]
      @name = social_site[:name]
    end    
  end
end