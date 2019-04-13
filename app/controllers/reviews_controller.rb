class ReviewsController < ApplicationController
  def index
    @q = Review.ransack(params[:q])
    @reviews = @q.result(:distinct => true).includes(:user, :product).page(params[:page]).per(10)

    render("review_templates/index.html.erb")
  end

  def show
    @review = Review.find(params.fetch("id_to_display"))

    render("review_templates/show.html.erb")
  end

  def new_form
    @review = Review.new

    render("review_templates/new_form.html.erb")
  end

  def create_row
    @review = Review.new

    @review.body = params.fetch("body")
    @review.user_id = params.fetch("user_id")
    @review.product_id = params.fetch("product_id")
    @review.would_use_again = params.fetch("would_use_again")

    if @review.valid?
      @review.save

      redirect_back(:fallback_location => "/reviews", :notice => "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def create_row_from_product
    @review = Review.new

    @review.body = params.fetch("body")
    @review.user_id = params.fetch("user_id")
    @review.product_id = params.fetch("product_id")
    @review.would_use_again = params.fetch("would_use_again")

    if @review.valid?
      @review.save

      redirect_to("/products/#{@review.product_id}", notice: "Review created successfully.")
    else
      render("review_templates/new_form_with_errors.html.erb")
    end
  end

  def edit_form
    @review = Review.find(params.fetch("prefill_with_id"))

    render("review_templates/edit_form.html.erb")
  end

  def update_row
    @review = Review.find(params.fetch("id_to_modify"))

    @review.body = params.fetch("body")
    @review.user_id = params.fetch("user_id")
    @review.product_id = params.fetch("product_id")
    @review.would_use_again = params.fetch("would_use_again")

    if @review.valid?
      @review.save

      redirect_to("/reviews/#{@review.id}", :notice => "Review updated successfully.")
    else
      render("review_templates/edit_form_with_errors.html.erb")
    end
  end

  def destroy_row_from_user
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/users/#{@review.user_id}", notice: "Review deleted successfully.")
  end

  def destroy_row_from_product
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/products/#{@review.product_id}", notice: "Review deleted successfully.")
  end

  def destroy_row
    @review = Review.find(params.fetch("id_to_remove"))

    @review.destroy

    redirect_to("/reviews", :notice => "Review deleted successfully.")
  end
end
