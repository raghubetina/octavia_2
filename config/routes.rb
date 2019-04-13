Rails.application.routes.draw do
  # Routes for the Product resource:

  # CREATE
  get("/products/new", { :controller => "products", :action => "new_form" })
  post("/create_product", { :controller => "products", :action => "create_row" })

  # READ
  get("/products", { :controller => "products", :action => "index" })
  get("/products/:id_to_display", { :controller => "products", :action => "show" })

  # UPDATE
  get("/products/:prefill_with_id/edit", { :controller => "products", :action => "edit_form" })
  post("/update_product/:id_to_modify", { :controller => "products", :action => "update_row" })

  # DELETE
  get("/delete_product/:id_to_remove", { :controller => "products", :action => "destroy_row" })

  #------------------------------

  # Routes for the Age group resource:

  # CREATE
  get("/age_groups/new", { :controller => "age_groups", :action => "new_form" })
  post("/create_age_group", { :controller => "age_groups", :action => "create_row" })

  # READ
  get("/age_groups", { :controller => "age_groups", :action => "index" })
  get("/age_groups/:id_to_display", { :controller => "age_groups", :action => "show" })

  # UPDATE
  get("/age_groups/:prefill_with_id/edit", { :controller => "age_groups", :action => "edit_form" })
  post("/update_age_group/:id_to_modify", { :controller => "age_groups", :action => "update_row" })

  # DELETE
  get("/delete_age_group/:id_to_remove", { :controller => "age_groups", :action => "destroy_row" })

  #------------------------------

  # Routes for the Density resource:

  # CREATE
  get("/densities/new", { :controller => "densities", :action => "new_form" })
  post("/create_density", { :controller => "densities", :action => "create_row" })

  # READ
  get("/densities", { :controller => "densities", :action => "index" })
  get("/densities/:id_to_display", { :controller => "densities", :action => "show" })

  # UPDATE
  get("/densities/:prefill_with_id/edit", { :controller => "densities", :action => "edit_form" })
  post("/update_density/:id_to_modify", { :controller => "densities", :action => "update_row" })

  # DELETE
  get("/delete_density/:id_to_remove", { :controller => "densities", :action => "destroy_row" })

  #------------------------------

  # Routes for the Porosity resource:

  # CREATE
  get("/porosities/new", { :controller => "porosities", :action => "new_form" })
  post("/create_porosity", { :controller => "porosities", :action => "create_row" })

  # READ
  get("/porosities", { :controller => "porosities", :action => "index" })
  get("/porosities/:id_to_display", { :controller => "porosities", :action => "show" })

  # UPDATE
  get("/porosities/:prefill_with_id/edit", { :controller => "porosities", :action => "edit_form" })
  post("/update_porosity/:id_to_modify", { :controller => "porosities", :action => "update_row" })

  # DELETE
  get("/delete_porosity/:id_to_remove", { :controller => "porosities", :action => "destroy_row" })

  #------------------------------

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
