class SidebarLinkComponent < ViewComponent::Base
  with_collection_parameter :link
  attr_reader :link

  erb_template <<-ERB
    <div class='sidebar-item'>
      <%= link_to link[:href] do %>
        <span class='expanded'><%= link[:caption] %></span>
        <div class='icon <%= link[:icon] %> collapsed'></div>
      <% end %>
    </div>
  ERB

  def initialize(link:)
    @link = link
  end
end
