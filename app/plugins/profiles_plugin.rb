class ProfilesPlugin < Plugin
  depends_on :space

  routes do
    get 'me' => 'profiles#show_me', as: :my_profile
    scope 'profiles' do
      get '/' => 'profiles#index', as: :profiles
    end
    scope '@(:profile)' do
      get '/' => 'profiles#show', as: :profile
    end
  end
end