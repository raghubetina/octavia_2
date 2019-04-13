Rails.application.routes.draw do
  # Routes for the Curl pattern resource:

  # CREATE
  get("/curl_patterns/new", { :controller => "curl_patterns", :action => "new_form" })
  post("/create_curl_pattern", { :controller => "curl_patterns", :action => "create_row" })

  # READ
  get("/curl_patterns", { :controller => "curl_patterns", :action => "index" })
  get("/curl_patterns/:id_to_display", { :controller => "curl_patterns", :action => "show" })

  # UPDATE
  get("/curl_patterns/:prefill_with_id/edit", { :controller => "curl_patterns", :action => "edit_form" })
  post("/update_curl_pattern/:id_to_modify", { :controller => "curl_patterns", :action => "update_row" })

  # DELETE
  get("/delete_curl_pattern/:id_to_remove", { :controller => "curl_patterns", :action => "destroy_row" })

  #------------------------------

  devise_for :users
  # Routes for the User resource:

  # READ
  get("/users", { :controller => "users", :action => "index" })
  get("/users/:id_to_display", { :controller => "users", :action => "show" })

  #------------------------------

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
