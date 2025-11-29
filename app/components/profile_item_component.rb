class ProfileItemComponent < ViewComponent::Base
  with_collection_parameter :profile
  attr_reader :profile

  erb_template <<-ERB
    <div class='profile-item'>
      <%= link_to profile_path(profile.name) do %>
        <div class='list-card'>
          <div class='name strong'>@<%= profile.name %></div>
          <div class='bio dimmed'><%= profile.bio %></div>
        </div>
      <% end %>
    </div>
  ERB

  def initialize(profile:)
    @profile = profile
  end
end
