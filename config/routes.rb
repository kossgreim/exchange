Rails.application.routes.draw do
  namespace :v1 do
    post 'exchanges', to: 'rates#exchange'
  end
end
