module Ravelry
  # `Ravelry::User` corresponds to User objects in Ravelry and the `People#show` endpoint.
  #
  # This class requires your environment variables be set (see {file:README.md README}). API calls are authenticated using HTTP Basic Auth unless otherwise noted.
  #
  # #User objects
  #
  # To create an empty object:
  #
  # ```ruby
  # user = Ravelry::User.new
  # ```
  #
  # To complete the `GET` request, set the `id` (this is the desired user's username) and run:
  #
  # ```ruby
  # user.id = "feministy"
  # user.get
  # ```
  #
  # After calling `get`, you have access to all of the class methods below.
  # 
  # ##Initializing with an id
  # 
  # Optionally, you can initialize with an id:
  # 
  # ```ruby
  # user = Ravelry::User.new(id)
  # ```
  # 
  # And then run your get request:
  # 
  # ```ruby
  # user.get
  # ```
  # 
  # Upon completing the `get` request, all of your objects and methods will ready to use!
  #
  # ##Loading existing user data
  #
  # If you have existing user data, you should initialize as follows:
  #
  # ```ruby
  # user = Ravelry::User.new
  # user.data = my_data
  # ```
  #
  # You now have access to all class methods for your user. Be warned: if you run `get` again, you will override your data with fresh information from the API call.
  #
   # This will create the following objects and readers from the existing `data`:
  #
  # * `user.pattern_author` (alias: `user.author`) - a {Ravelry::Author} object
  # * `user.user_sites` - an array of {Ravelry::UserSite} objects
  #
  # See the documentation for each object's available methods.
  #
  class User < Data
    attr_reader :pattern_author, :user_sites

    def get
      request = Typhoeus::Request.get("https://api.ravelry.com/people/#{@id}.json", userpwd: "#{Ravelry.configuration.access_key}:#{Ravelry.configuration.personal_key}")
      result = JSON.parse(request.response_body, {symbolize_names: true})
      @data = result[:user]
      @pattern_author = Build.author(@data)
      @user_sites = Build.user_sites(@data)
      self
    end

    def about_me
      @data['about_me']
    end

    def about_me_html
      @data['about_me_html']
    end

    def author
      @pattern_author
    end

    def fave_colors
      @data['fave_colors']
    end

    def fave_curse
      @data['fave_curse']
    end

    def first_name
      @data['first_name']
    end

    def large_photo_url
      @data['large_photo_url']
    end

    def location
      @data['location']
    end

    def photo_url
      @data['photo_url']
    end

    def small_photo_url
      @data['small_photo_url']
    end

    def tiny_photo_url
      @data['tiny_photo_url']
    end

    def username
      @data['username']
    end

    # ID from the Ravelry database.
    # 
    def _id
      @data['id']
    end
  end
end
