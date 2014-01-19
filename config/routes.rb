SampleApp::Application.routes.draw do
    root 'static_pages#index'
    match '/', to: 'static_pages#index', via: 'get'
    match '/help/', to: 'static_pages#help', via: 'get'
    get 'static_pages/help'
end
