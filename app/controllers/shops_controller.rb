class ShopsController < ApplicationController
  def index
    matching_shops = @current_user.shops

    @list_of_shops = matching_shops.order({ :created_at => :desc })

    render({ :template => "shops/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_shops = Shop.where({ :id => the_id })

    @the_shop = matching_shops.at(0)

    render({ :template => "shops/show.html.erb" })
  end

  def create
    the_shop = Shop.new
    the_shop.website = params.fetch("query_website")
    the_shop.name_of_shop = params.fetch("query_name_of_shop")
    the_shop.user_shop_id = @current_user.id
    # the_shop.where_to_buys_count = params.fetch("query_where_to_buys_count")

    if the_shop.valid?
      the_shop.save
      redirect_to("/shops", { :notice => "Shop created successfully." })
    else
      redirect_to("/shops", { :alert => the_shop.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_shop = Shop.where({ :id => the_id }).at(0)

    the_shop.website = params.fetch("query_website")
    the_shop.location = params.fetch("query_location")
    the_shop.name_of_shop = params.fetch("query_name_of_shop")
    the_shop.where_to_buys_count = params.fetch("query_where_to_buys_count")

    if the_shop.valid?
      the_shop.save
      redirect_to("/shops/#{the_shop.id}", { :notice => "Shop updated successfully."} )
    else
      redirect_to("/shops/#{the_shop.id}", { :alert => the_shop.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_shop = Shop.where({ :id => the_id }).at(0)

    the_shop.destroy

    redirect_to("/shops", { :notice => "Shop deleted successfully."} )
  end
end
