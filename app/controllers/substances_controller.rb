class SubstancesController < ApplicationController
  def index
    @substances = Substance.all

    render("substance_templates/index.html.erb")
  end

  def show
    @ingredient = Ingredient.new
    @substance = Substance.find(params.fetch("id_to_display"))

    render("substance_templates/show.html.erb")
  end

  def new_form
    @substance = Substance.new

    render("substance_templates/new_form.html.erb")
  end

  def create_row
    @substance = Substance.new

    @substance.name = params.fetch("name")

    if @substance.valid?
      @substance.save

      redirect_back(:fallback_location => "/substances", :notice => "Substance created successfully.")
    else
      render("substance_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @substance = Substance.find(params.fetch("prefill_with_id"))

    render("substance_templates/edit_form.html.erb")
  end

  def update_row
    @substance = Substance.find(params.fetch("id_to_modify"))

    @substance.name = params.fetch("name")

    if @substance.valid?
      @substance.save

      redirect_to("/substances/#{@substance.id}", :notice => "Substance updated successfully.")
    else
      render("substance_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @substance = Substance.find(params.fetch("id_to_remove"))

    @substance.destroy

    redirect_to("/substances", :notice => "Substance deleted successfully.")
  end
end
