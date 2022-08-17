class GiftsController < ApplicationController
  
  

  def home

    if @current_user == nil

      render({ :template => "gifts/home.html.erb" })

    else

      render({ :template => "gifts/alt_home.html.erb" })

    end
    
  end
  
  def find

    @the_first_name = params.fetch("query_first_name_of_desired_user")
    @the_last_name = params.fetch("query_last_name_of_desired_user")
    @the_user_tag = params.fetch("query_link_of_desired_user")

    if @the_first_name == "NA"

      @the_id = User.where({ :shareable_tag => @the_user_tag })

    else

      @the_id = User.where({ :first_name => @the_first_name, :last_name => @the_last_name })

    end

    begin

    @matching_gifts = @the_id.first.requested_gifts

    @list_of_gifts = @matching_gifts.order({ :created_at => :asc })

    render({ :template => "gifts/user_index.html.erb" })

    rescue

      redirect_to("/", { :alert => "The user you have entered does not exist - please check spelling and try again." })

    end


  end
  
  
  def index
    matching_gifts = @current_user.requested_gifts

    @list_of_gifts = matching_gifts.order({ :created_at => :desc })

    render({ :template => "gifts/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_gifts = Gift.where({ :id => the_id })

    @the_gift = matching_gifts.at(0)

    if @current_user != nil

      if @current_user.id != @the_gift.user.id

        render({ :template => "gifts/user_show.html.erb" })

      else

        render({ :template => "gifts/show.html.erb" })

      end

    else

      render({ :template => "gifts/user_show.html.erb" })

    end
    
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
    the_gift.description = params.fetch("query_description")
    the_gift.category_id = params.fetch("query_category_id")
    the_gift.name_of_gift = params.fetch("query_name_of_gift")

    if the_gift.valid?
      the_gift.save
      redirect_to("/gifts/#{the_gift.id}", { :notice => "Gift updated successfully."} )
    else
      redirect_to("/gifts/#{the_gift.id}", { :alert => the_gift.errors.full_messages.to_sentence })
    end
  end

  def purchase
    the_id = params.fetch("path_id")
    @the_gift = Gift.where({ :id => the_id }).at(0)

    render({ :template => "gifts/buy_gift.html.erb" })
   
  end


  def confirm
    the_id = params.fetch("path_id")
    the_gift = Gift.where({ :id => the_id }).at(0)

    if @current_user != nil

      the_gift.buyer_id = @current_user.id

    else

      the_gift.buyer_id = "99999"

    end

    the_gift.status_of_gift = "Purchased"

    if the_gift.valid?
      the_gift.save
      redirect_to("/gifts/#{the_gift.id}", { :notice => "Gift purchased successfully. Thank you!"} )
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
