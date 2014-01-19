SampleApp::Application.routes.draw do
    root 'static_pages#index'
    match '/', to: 'static_pages#index', via: 'get'
end
