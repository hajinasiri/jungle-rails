class ReviewsController < ApplicationController
before_action :require_login
  def create
    @review = Review.new(review_params)
    @review.product_id = params[:product_id]
    @review.user = current_user
    @review.user_id = current_user.id
    if @review.save
      redirect_to product_path(@review.product_id)
    else

      redirect_to product_path(@review.product_id)
      # flash: { error: @review.errors.full_messages }
      puts "<<<<<>>>>>>>>>"
      puts @review.errors.full_messages
    end
  end

  def destroy
    review = Review.find(params[:id])
    if review.user == current_user
      review.destroy
    end
    redirect_to product_path(params[:product_id])
  end

  private
    def review_params
      params.require(:review).permit(:rating, :description, :product_id)
    end

    def require_login
    unless logged_in?
      flash[:error] = "You must be logged in to access this section"
      redirect_to login_path
    end
  end
end
