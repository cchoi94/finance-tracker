# frozen_string_literal: true

class StocksController < ApplicationController
  def search
    if params[:stock].present?
      @stock = Stock.new_from_lookup(params[:stock])
      if @stock
        respond_to do |format|
          format.js { render partial: 'users/result' }
        end
      else
        # render json: @stock
        flash[:danger] = 'You have entered an incorrect string'
        render partial: 'users/result'
      end
    else
      flash[:danger] = 'You have entered an empty search string'
      render partial: 'users/result'
    end
  end
end
