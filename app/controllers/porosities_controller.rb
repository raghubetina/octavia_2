class PorositiesController < ApplicationController
  def index
    @porosities = Porosity.all

    render("porosity_templates/index.html.erb")
  end

  def show
    @porosity = Porosity.find(params.fetch("id_to_display"))

    render("porosity_templates/show.html.erb")
  end

  def new_form
    @porosity = Porosity.new

    render("porosity_templates/new_form.html.erb")
  end

  def create_row
    @porosity = Porosity.new

    @porosity.level = params.fetch("level")
    @porosity.description = params.fetch("description")
    @porosity.position = params.fetch("position")

    if @porosity.valid?
      @porosity.save

      redirect_back(:fallback_location => "/porosities", :notice => "Porosity created successfully.")
    else
      render("porosity_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @porosity = Porosity.find(params.fetch("prefill_with_id"))

    render("porosity_templates/edit_form.html.erb")
  end

  def update_row
    @porosity = Porosity.find(params.fetch("id_to_modify"))

    @porosity.level = params.fetch("level")
    @porosity.description = params.fetch("description")
    @porosity.position = params.fetch("position")

    if @porosity.valid?
      @porosity.save

      redirect_to("/porosities/#{@porosity.id}", :notice => "Porosity updated successfully.")
    else
      render("porosity_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @porosity = Porosity.find(params.fetch("id_to_remove"))

    @porosity.destroy

    redirect_to("/porosities", :notice => "Porosity deleted successfully.")
  end
end
