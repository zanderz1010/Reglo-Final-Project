class CategoriesController < ApplicationController
  def index
    matching_categories = @current_user.categories

    @list_of_categories = matching_categories.order({ :created_at => :desc })

    render({ :template => "categories/index.html.erb" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_categories = Category.where({ :id => the_id })

    @the_category = matching_categories.at(0)

    render({ :template => "categories/show.html.erb" })
  end

  def create
    the_category = Category.new
    the_category.name = params.fetch("query_name")
    the_category.gifts_count = params.fetch("query_gifts_count")
    the_category.user_category_id = @current_user.id

    if the_category.valid?
      the_category.save
      redirect_to("/categories", { :notice => "Category created successfully." })
    else
      redirect_to("/categories", { :alert => the_category.errors.full_messages.to_sentence })
    end
  end

  def update
    the_id = params.fetch("path_id")
    the_category = Category.where({ :id => the_id }).at(0)

    the_category.name = params.fetch("query_name")
    the_category.gifts_count = 0

    if the_category.valid?
      the_category.save
      redirect_to("/categories/#{the_category.id}", { :notice => "Category updated successfully."} )
    else
      redirect_to("/categories/#{the_category.id}", { :alert => the_category.errors.full_messages.to_sentence })
    end
  end

  def destroy
    the_id = params.fetch("path_id")
    the_category = Category.where({ :id => the_id }).at(0)

    the_category.destroy

    redirect_to("/categories", { :notice => "Category deleted successfully."} )
  end
end
