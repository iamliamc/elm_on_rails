class MenuController < ApplicationController

  def index

  end

  def show
    begin
      # @food = [
      #   {id: "1", name: "American", items: [ { id: "1", name: "Burger", description: "American Patty Medium Rare", price: 12} ] },
      #   {id: "2", name: "Mexican", items: [ { id: "4", name: "Burrito", description: "Flour tortilla, black beans, rice, guacamole", price: 8 } ] },
      #   {id: "3", name: "Italian", items: [ { id: "7", name: "Spagetti", description: "Red Sauce and Pasta", price: 10 } ] },
      #   {id: "4", name: "Chinese", items: [ { id: "10", name: "Mongolian Beef", description: "Seared Beef in Garlic Sauce", price: 9 } ] } ]
      @food = []
      Menu.all.each do |m|
        package = {}
        package["id"] = m.id.to_s
        package["name"] = m.name
        package["items"] = m.items
        @food.push(package)
      end
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
