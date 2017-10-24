Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "task#home"
  get "/task/:qq_number", to: "task#task"
  get "/finish/:id", to: "task#finish"

  get "/target_groups/:qq_number", to: "task#target_groups"
  get "/update_taget_groups/:qq_number", to: "task#update_target_groups"
end
