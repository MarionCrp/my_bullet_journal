class User::TasksController <  User::BaseController
  def index
    # @month = params[:month] || Time.zone.today.month
    @regular_task_categories = Categories::RegularTask.enabled
    @regular_tasks = Tasks::RegularTask.done.by_month(Time.zone.today)

    @monthly_days = []
    i = Time.zone.today.beginning_of_month
    while i.month == Time.zone.today.month do
      @monthly_days << {
        date: i,
        wday: i.wday,
        day: i.day,
        categories: []
      }
      i = i.tomorrow
    end
    @regular_tasks.each do |task|
      active_day = @monthly_days.select { |day| day[:day] == task.date.day }[0]
      active_day[:categories] << task.category.id
    end
  end
end
