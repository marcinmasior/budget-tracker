class CategoriesController < DashboardController
  before_action :set_category, only: %i[ edit update destroy ]

  def index
    @q = current_user.categories.ransack(params[:q] || default_ransack_params)
    @categories = @q.result
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    @category = Category.new(category_params)
    @category.user = current_user

    if @category.save
      redirect_to categories_url, notice: "Category was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @category.update(category_params)
      redirect_to categories_url, notice: "Category was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @category.destroy

    redirect_to categories_url, notice: "Category was successfully destroyed."
  end

  private
    def set_category
      @category = current_user.categories.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name)
    end

    def default_ransack_params
      { s: "name asc" }
    end
end
