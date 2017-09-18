class User::RegularTaskCategoriesController < User::BaseController

  before_action :find_regular_task_category, only: [:edit, :update, :destroy, :toggle_enabled]

  def index
    @categories = current_user.regular_task_categories.all
  end

  def new
    @category = current_user.regular_task_categories.new()
  end

  def edit
  end

  def create
    @category = current_user.regular_task_categories.new(regular_task_category_params)
    if @category.save
      flash[:success] = "The category has been created with success"
      redirect_to user_regular_task_categories_path
    else
      flash[:error] = "Error when creating a category"
      render :new
    end
  end

  def update
    @category.attributes = regular_task_category_params
    if @category.save
      flash[:success] = "The category has been updated with success"
      redirect_to user_regular_task_categories_path
    else
      flash[:error] = "Error when updating a category"
      render :edit
    end
  end

  def destroy
    if @category.destroy
      flash[:success] = "The category has been destroyed with success"
    else
      flash[:error] = "Error when destroying the category"
    end
    redirect_to user_regular_task_categories_path
  end

  def toggle_enabled
    if @category.toggle!(:enable)
      flash[:success] = "The category has been #{@category.enable? ? 'enabled' : 'disabled' }"
    else
      flash[:error] = "Error when updated the category"
    end
    redirect_to user_regular_task_categories_path
  end

  private

  def find_regular_task_category
    @category = current_user.regular_task_categories.find(params[:id])
  end

  def regular_task_category_params
    params.require(:regular_task_category).permit(:title)
  end
end
