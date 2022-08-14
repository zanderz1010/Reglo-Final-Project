class GiftsController < ApplicationController
  def index
    matching_gifts = Gift.all

    @list_of_gifts = matching_gifts.order({ :created_at => :desc })

    render({ :template => "gifts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_gifts = Gift.where({ :id => the_id })

    @the_gift = matching_gifts.at(0)

    render({ :template => "gifts/show.html.erb" })
  end

  def create
    the_gift = Gift.new
    the_gift.price = params.fetch("query_price")
    the_gift.status_of_gift = params.fetch("query_status_of_gift")
    the_gift.description = params.fetch("query_description")
    the_gift.category_id = params.fetch("query_category_id")
    the_gift.name_of_gift = params.fetch("query_name_of_gift")
    the_gift.requester_id = params.fetch("query_requester_id")
    # the_gift.buyer_id = params.fetch("query_buyer_id")
    # the_gift.where_to_buys_count = params.fetch("query_where_to_buys_count")

    if the_gift.valid?
      the_gift.save
      redirect_to("/gifts", { :notice => "Gift created successfully." })
    else
      redirect_to("/gifts", { :alert => the_gift.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_gift = Gift.where({ :id => the_id }).at(0)

    the_gift.price = params.fetch("query_price")
    the_gift.status_of_gift = params.fetch("query_status_of_gift")
    the_gift.description = params.fetch("query_description")
    the_gift.category_id = params.fetch("query_category_id")
    the_gift.name_of_gift = params.fetch("query_name_of_gift")
    the_gift.requester_id = params.fetch("query_requester_id")
    the_gift.buyer_id = params.fetch("query_buyer_id")
    the_gift.where_to_buys_count = params.fetch("query_where_to_buys_count")

    if the_gift.valid?
      the_gift.save
      redirect_to("/gifts/#{the_gift.id}", { :notice => "Gift updated successfully."} )
    else
      redirect_to("/gifts/#{the_gift.id}", { :alert => the_gift.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_gift = Gift.where({ :id => the_id }).at(0)

    the_gift.destroy

    redirect_to("/gifts", { :notice => "Gift deleted successfully."} )
  end
end
