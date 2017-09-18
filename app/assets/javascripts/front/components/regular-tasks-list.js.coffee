Vue.component 'regular-tasks-list', {
  template: '#regular-tasks-list-template',
  props: {
    daysUrl: String,
    currentUserId: Number
  },
  components: ['toggle-task-btn'],
  data: -> {
    monthUrl: this.daysUrl,
    monthlyDays: [],
    regularTasks: [],
    regularTaskCategories: [],
    date: null,
    month: null,
    previous_month_url: null,
    next_month_url: null
  },
  methods: {
    refreshRegularTasks: ->
      this.$http.get(this.monthUrl).then (response) =>
        this.monthlyDays = response.body.monthly_days
        this.regularTasks = response.body.regular_tasks
        this.regularTaskCategories = response.body.regular_task_categories
        this.date = response.body.date.date
        this.month = response.body.month
        this.previous_month_url = response.body.previous_month_url
        this.next_month_url = response.body.next_month_url

    getPreviousMonth: ->
      this.monthUrl = this.previous_month_url
      this.refreshRegularTasks()

    getNextMonth: ->
      this.monthUrl = this.next_month_url
      this.refreshRegularTasks()

    dayIsDone: (day, category) ->
      return day.categories.includes(category)
  },
  mounted: ->
    this.refreshRegularTasks()

}
