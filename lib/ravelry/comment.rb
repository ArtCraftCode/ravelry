module Ravelry

  # The information used to create `Ravelry::Comment` comes from {Ravelry::Pattern} objects.
  #
  # You should not create `Comment` objects manually; they are all created–and owned by–by a {Ravelry::Pattern}.
  #
  # See {Ravelry::Pattern} for more information about `Pattern` objects.
  #
  class Comment
    attr_reader :highlighted_project, :user, :html, :id

    # Creates new `Comment` from Ravelry API Pattern Comment attributes.
    #
    # All class variables are readonly.
    #
    def initialize(data)
      @data = data
      @user = Ravelry::User.new
      @user.data = data[:user]
      @highlighted_project = data[:highlighted_project]      
      @html = data[:html]
      @id = data[:id]
    end

    def replies
      @reply_list ||= []
      return @reply_list if @reply_list.any?
      @data[:replies].map do |reply|
        @reply_list << Ravelry::Comment.new(reply)
      end
    end
  end

end
