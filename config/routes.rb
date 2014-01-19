SampleApp::Application.routes.draw do
    match '/', to: 'static_pages#index', via: 'get'
end
