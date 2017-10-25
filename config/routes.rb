Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root "task#home"
  get "/task/:qq_number", to: "task#task"
  get "/finish/:id", to: "task#finish"

  get "/target_groups/:qq_number", to: "task#target_groups"
  get "/update_target_groups/:qq_number", to: "task#update_target_groups"

  get "/luhan/", to: "task#lh"

  get "/one/upload_groups/:qq_number", to: "one#upload_groups"
  get "/one/get_tasks/:qq_number", to: "one#get_tasks"
  get "/one/finish/:id", to: "one#finish"
end
