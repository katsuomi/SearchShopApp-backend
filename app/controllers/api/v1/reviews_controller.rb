module Api
  module V1
    class ReviewsController < ApplicationController
      def index
        reviews = Review.all
        render json: { status: 'SUCCESS', message: 'loaded reviews', data: reviews }
      end

      def show
        review = Review.find(params[:id])
        render json: { status: 'SUCCESS', message: 'loaded the review', data: review }
      end

      def shop_show
        shop_reviews = Review.where(shop_id: params[:shop_id])
        render json: { status: 'SUCCESS', message: 'loaded the review', data: shop_reviews }
      end

      def create
        review = Review.new(review_params)
        if review.save
          render json: { status: 'SUCCESS', message: 'loaded the review', data: review }
        else
          render json: { status: 'ERROR', message: 'review not saved', data: review.errors }
        end
      end

      def destroy
        review = Review.find(params[:id])
        review.destroy
        render json: { status: 'SUCCESS', message: 'deleted the review', data: review }
      end

      def update
        review = Review.find(params[:id])
        if review.update(review_params)
          render json: { status: 'SUCCESS', message: 'updated the review', data: review }
        else
          render json: { status: 'SUCCESS', message: 'loaded the review', data: review }
        end
      end

      private

      def review_params
        params.require(:review).permit(:star,:comment,:shop_id)
      end
    end
  end
end
