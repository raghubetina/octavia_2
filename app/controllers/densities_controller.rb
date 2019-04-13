class DensitiesController < ApplicationController
  def index
    @q = Density.ransack(params[:q])
    @densities = @q.result(:distinct => true).includes(:users, :products).page(params[:page]).per(10)

    render("density_templates/index.html.erb")
  end

  def show
    @user = User.new
    @density = Density.find(params.fetch("id_to_display"))

    render("density_templates/show.html.erb")
  end

  def new_form
    @density = Density.new

    render("density_templates/new_form.html.erb")
  end

  def create_row
    @density = Density.new

    @density.level = params.fetch("level")
    @density.description = params.fetch("description")
    @density.position = params.fetch("position")

    if @density.valid?
      @density.save

      redirect_back(:fallback_location => "/densities", :notice => "Density created successfully.")
    else
      render("density_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @density = Density.find(params.fetch("prefill_with_id"))

    render("density_templates/edit_form.html.erb")
  end

  def update_row
    @density = Density.find(params.fetch("id_to_modify"))

    @density.level = params.fetch("level")
    @density.description = params.fetch("description")
    @density.position = params.fetch("position")

    if @density.valid?
      @density.save

      redirect_to("/densities/#{@density.id}", :notice => "Density updated successfully.")
    else
      render("density_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @density = Density.find(params.fetch("id_to_remove"))

    @density.destroy

    redirect_to("/densities", :notice => "Density deleted successfully.")
  end
end
