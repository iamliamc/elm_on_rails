class MenuController < ApplicationController

  def index

  end

  def show
    @food = ["Fries", "Zuchhini", "Pumpkin Pie", "Apples"]
    respond_to do |f|
      f.json { render json: @food.to_json }
    end
  end

end
