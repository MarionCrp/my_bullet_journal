class User::RegularTasksController < User::BaseController
  def create
    date = params[:regular_task_date]
    category_id = params[:regular_task_category_id].to_i
    done = params[:done]
    task = Tasks::RegularTask.where(date: date, category_id: category_id).first_or_create.update(done: done)
    redirect_to user_tasks_path
  end
end
