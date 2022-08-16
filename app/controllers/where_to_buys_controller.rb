class WhereToBuysController < ApplicationController
  def index
    matching_where_to_buys = @current_user.where_to_buys

    @list_of_where_to_buys = matching_where_to_buys.order({ :created_at => :desc })

    render({ :template => "where_to_buys/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_where_to_buys = WhereToBuy.where({ :id => the_id })

    @the_where_to_buy = matching_where_to_buys.at(0)

    render({ :template => "where_to_buys/show.html.erb" })
  end

  def create
    the_where_to_buy = WhereToBuy.new
    the_where_to_buy.gift_id = params.fetch("query_gift_id")
    the_where_to_buy.shop_id = params.fetch("query_shop_id")
    the_where_to_buy.user_where_id = @current_user.id

    if the_where_to_buy.valid?
      the_where_to_buy.save
      redirect_to("/where_to_buys", { :notice => "Where to buy created successfully." })
    else
      redirect_to("/where_to_buys", { :alert => the_where_to_buy.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_where_to_buy = WhereToBuy.where({ :id => the_id }).at(0)

    the_where_to_buy.gift_id = params.fetch("query_gift_id")
    the_where_to_buy.shop_id = params.fetch("query_shop_id")

    if the_where_to_buy.valid?
      the_where_to_buy.save
      redirect_to("/where_to_buys/#{the_where_to_buy.id}", { :notice => "Where to buy updated successfully."} )
    else
      redirect_to("/where_to_buys/#{the_where_to_buy.id}", { :alert => the_where_to_buy.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_where_to_buy = WhereToBuy.where({ :id => the_id }).at(0)

    the_where_to_buy.destroy

    redirect_to("/where_to_buys", { :notice => "Where to buy deleted successfully."} )
  end
end
