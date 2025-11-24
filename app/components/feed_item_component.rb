class FeedItemComponent < ViewComponent::Base
  with_collection_parameter :post
  attr_reader :post, :profile

  erb_template <<-ERB
    <div class='feed-item'>
      <div class='header'>
        <span class='username'>
          <%= link_to('@' + profile.name, profile_path(profile: profile.name)) %> 
        </span>
        <span class='info'>
          <%= time_ago_in_words(post.created_at) + " ago" %>
        </span>
      </div>
      <hr />
      <div class='body'>
        <%== post.content %>
      </div>
      <hr />
      <div class='footer'>
        <%= link_to "Open", post_path(profile: profile.name, post_id: post.id) %> 
      </div>
    </div>
  ERB

  def initialize(post:)
    @post = post
    @profile = @post.profile
  end
end
