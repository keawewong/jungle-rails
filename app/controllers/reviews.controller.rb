class ReviewsController < ApplicationController

before_filter :require_login

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(
      user_id:[current_user.id],
      product_id:params[:product_id],
      description: params[:review][:description],
      rating: params[:review][:rating]
      )

    @review.user = current_user

    if @review.save
      puts "review complete"
      redirect_to '/'
    else
      redirect_to "/products/#{params[:product_id]}"
    end
  end

  def destroy
    @review = Review.find params[:id]
    @review.destroy
    redirect_to "/products/#{params[:product_id]}"
  end

  private

  def require_login
    if current_user
      return true
    end
  end

end
