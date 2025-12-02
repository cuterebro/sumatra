class FeedPlugin < Plugin
  depends_on :profiles

  routes do
    root 'feed#index'
    scope '@(:profile)' do
      get ':post_id' => 'posts#show', as: :post
    end    
  end
end