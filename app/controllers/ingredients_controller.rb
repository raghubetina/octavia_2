class IngredientsController < ApplicationController
  def index
    @q = Ingredient.ransack(params[:q])
    @ingredients = @q.result(:distinct => true).includes(:product, :substance).page(params[:page]).per(10)

    render("ingredient_templates/index.html.erb")
  end

  def show
    @ingredient = Ingredient.find(params.fetch("id_to_display"))

    render("ingredient_templates/show.html.erb")
  end

  def new_form
    @ingredient = Ingredient.new

    render("ingredient_templates/new_form.html.erb")
  end

  def create_row
    @ingredient = Ingredient.new

    @ingredient.product_id = params.fetch("product_id")
    @ingredient.substance_id = params.fetch("substance_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_back(:fallback_location => "/ingredients", :notice => "Ingredient created successfully.")
    else
      render("ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_product
    @ingredient = Ingredient.new

    @ingredient.product_id = params.fetch("product_id")
    @ingredient.substance_id = params.fetch("substance_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/products/#{@ingredient.product_id}", notice: "Ingredient created successfully.")
    else
      render("ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_substance
    @ingredient = Ingredient.new

    @ingredient.product_id = params.fetch("product_id")
    @ingredient.substance_id = params.fetch("substance_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/substances/#{@ingredient.substance_id}", notice: "Ingredient created successfully.")
    else
      render("ingredient_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @ingredient = Ingredient.find(params.fetch("prefill_with_id"))

    render("ingredient_templates/edit_form.html.erb")
  end

  def update_row
    @ingredient = Ingredient.find(params.fetch("id_to_modify"))

    @ingredient.product_id = params.fetch("product_id")
    @ingredient.substance_id = params.fetch("substance_id")

    if @ingredient.valid?
      @ingredient.save

      redirect_to("/ingredients/#{@ingredient.id}", :notice => "Ingredient updated successfully.")
    else
      render("ingredient_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_product
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/products/#{@ingredient.product_id}", notice: "Ingredient deleted successfully.")
  end

  def destroy_row_from_substance
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/substances/#{@ingredient.substance_id}", notice: "Ingredient deleted successfully.")
  end

  def destroy_row
    @ingredient = Ingredient.find(params.fetch("id_to_remove"))

    @ingredient.destroy

    redirect_to("/ingredients", :notice => "Ingredient deleted successfully.")
  end
end
