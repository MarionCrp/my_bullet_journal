class User::RegularTasksController < User::BaseController

  def index
    if params[:date].present?
      @date = Time.parse(params[:date])
    else
      @date = Time.zone.today.beginning_of_month
    end
    @regular_tasks = Tasks::RegularTask.done.by_month(@date)
    @regular_task_categories = Categories::RegularTask.enabled

    @monthly_days = []
    i = @date.beginning_of_month
    while i.month == @date.month do
      @monthly_days << {
        date: i,
        wday: I18n.t("date.day_names_letter")[i.wday],
        day: i.day,
        categories: []
      }
      i = i.tomorrow
    end
    @regular_tasks.each do |task|
      active_day = @monthly_days.select { |day| day[:day] == task.date.day }[0]
      active_day[:categories] << task.category.id
    end

    respond_to do |format|
      format.json {
        render json: { monthly_days: @monthly_days, regular_tasks: @regular_tasks, regular_task_categories: @regular_task_categories, date: @date, month: I18n.l(@date, format: '%B %Y'), previous_month_url: user_regular_tasks_path(date: (@date - 1.month).beginning_of_month), next_month_url: user_regular_tasks_path(date: (@date + 1.month).beginning_of_month)
        }
      }
    end
  end

  def toggle_done
    find_regular_task
    success = @regular_task.toggle!(:done)

    respond_to do |format|
      format.json {
      if success
        render json: { done: @regular_task.done }
      else
        render status: 422, json: { errors: "Une erreur est survenue" }
      end
       }
    end
  end

  private

  def find_regular_task
    @regular_task = current_user.regular_tasks.where(regular_task_params).first_or_create(regular_task_params)
  end

  def regular_task_params
    params.require(:regular_task).permit(:date, :category_id)
  end
end
