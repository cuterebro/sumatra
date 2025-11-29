class FeedItemComponent < ViewComponent::Base
  with_collection_parameter :post
  attr_reader :post, :profile

  erb_template <<-ERB
    <div class='feed-item card'>
      <div class='header'>
        <span class='username'>
          <%= link_to('@' + profile.name, profile_path(profile: profile.name), class: 'strong') %> 
        </span>
        <span class='info small dimmed'>
          <%= helpers.time_ago_string(post.created_at) %>
        </span>
      </div>
      <hr />
      <div class='body'>
        <%== post.content %>
      </div>
      <hr />
      <div class='footer small'>
        <%= link_to "[↵] Open", post_path(profile: profile.name, post_id: post.id), class: 'dimmed' %> 
      </div>
    </div>
  ERB

  def initialize(post:)
    @post = post
    @profile = @post.profile
  end
end
