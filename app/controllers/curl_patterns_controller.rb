class CurlPatternsController < ApplicationController
  def index
    @q = CurlPattern.ransack(params[:q])
    @curl_patterns = @q.result(:distinct => true).includes(:users, :products).page(params[:page]).per(10)

    render("curl_pattern_templates/index.html.erb")
  end

  def show
    @user = User.new
    @curl_pattern = CurlPattern.find(params.fetch("id_to_display"))

    render("curl_pattern_templates/show.html.erb")
  end

  def new_form
    @curl_pattern = CurlPattern.new

    render("curl_pattern_templates/new_form.html.erb")
  end

  def create_row
    @curl_pattern = CurlPattern.new

    @curl_pattern.number = params.fetch("number")
    @curl_pattern.letter = params.fetch("letter")
    @curl_pattern.description = params.fetch("description")
    @curl_pattern.position = params.fetch("position")

    if @curl_pattern.valid?
      @curl_pattern.save

      redirect_back(:fallback_location => "/curl_patterns", :notice => "Curl pattern created successfully.")
    else
      render("curl_pattern_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @curl_pattern = CurlPattern.find(params.fetch("prefill_with_id"))

    render("curl_pattern_templates/edit_form.html.erb")
  end

  def update_row
    @curl_pattern = CurlPattern.find(params.fetch("id_to_modify"))

    @curl_pattern.number = params.fetch("number")
    @curl_pattern.letter = params.fetch("letter")
    @curl_pattern.description = params.fetch("description")
    @curl_pattern.position = params.fetch("position")

    if @curl_pattern.valid?
      @curl_pattern.save

      redirect_to("/curl_patterns/#{@curl_pattern.id}", :notice => "Curl pattern updated successfully.")
    else
      render("curl_pattern_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row
    @curl_pattern = CurlPattern.find(params.fetch("id_to_remove"))

    @curl_pattern.destroy

    redirect_to("/curl_patterns", :notice => "Curl pattern deleted successfully.")
  end
end
