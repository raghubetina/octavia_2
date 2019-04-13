class ProductCategoriesController < ApplicationController
  def index
    @product_categories = ProductCategory.page(params[:page]).per(10)

    render("product_category_templates/index.html.erb")
  end

  def show
    @product = Product.new
    @product_category = ProductCategory.find(params.fetch("id_to_display"))

    render("product_category_templates/show.html.erb")
  end

  def new_form
    @product_category = ProductCategory.new

    render("product_category_templates/new_form.html.erb")
  end

  def create_row
    @product_category = ProductCategory.new

    @product_category.name = params.fetch("name")

    if @product_category.valid?
      @product_category.save

      redirect_back(:fallback_location => "/product_categories", :notice => "Product category created successfully.")
    else
      render("product_category_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @product_category = ProductCategory.find(params.fetch("prefill_with_id"))

    render("product_category_templates/edit_form.html.erb")
  end

  def update_row
    @product_category = ProductCategory.find(params.fetch("id_to_modify"))

    @product_category.name = params.fetch("name")

    if @product_category.valid?
      @product_category.save

      redirect_to("/product_categories/#{@product_category.id}", :notice => "Product category updated successfully.")
    else
      render("product_category_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @product_category = ProductCategory.find(params.fetch("id_to_remove"))

    @product_category.destroy

    redirect_to("/product_categories", :notice => "Product category deleted successfully.")
  end
end
