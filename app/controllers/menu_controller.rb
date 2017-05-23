class MenuController < ApplicationController

  def index

  end

  def show
    begin
      @food = [{id: "1", name: "American"}, {id: "2", name: "Mexican"}, {id: "3", name: "Italian"}, {id: "4", name: "Chinese"}]
      respond_to do |f|
        f.json { render json: @food.to_json }
      end
    rescue Exception => e
      respond_to do |f|
        f.json {render json: {:message => e.message}.to_json, status: :unprocessable_entity}
      end
    end
  end

end
