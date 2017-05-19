class MenuController < ApplicationController

  def index

  end

  def show
    begin
      random = rand(1..10)
      if random >= 3
        @food = [["Fries", "Zuchhini", "Pumpkin Pie", "Apples"], ["Tacos", "Bananna Split", "Oranges", "Honeydew"], ["Tuna", "Spinach", "Rice", "Corn"]].sample
        respond_to do |f|
          f.json { render json: @food.to_json }
        end
      else
        raise "Random backend error!"
      end
    rescue Exception => e
      respond_to do |f|
        f.json {render json: {:message => e.message}.to_json, status: :unprocessable_entity}
      end
    end
  end

end
