Rails.application.routes.draw do
  namespace 'api' do
    namespace 'v1' do
      resources :reviews
      get '/shop_show', to: 'reviews#shop_show', as: :shop_show
    end
  end
end
