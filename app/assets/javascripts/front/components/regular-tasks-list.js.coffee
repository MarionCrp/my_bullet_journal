Vue.component 'regular-tasks-list', {
  template: '#regular-tasks-list-template',
  props: {
    daysUrl: String,
    currentUserId: Number
  },
  components: ['toggle-task-btn'],
  data: -> {
    monthlyDays: [],
    regularTasks: [],
    regularTaskCategories: [],
    errors: [],
    # resource: Vue.resource("#{this.resourceUrl}{/id}")
    loading: false
    editing: false
    append: false
  },
  methods: {
    refreshRegularTasks: ->
      this.$http.get(this.daysUrl).then (response) =>
        this.monthlyDays = response.body.monthly_days
        this.regularTasks = response.body.regular_tasks
        this.regularTaskCategories = response.body.regular_task_categories
  },
  mounted: ->
    this.refreshRegularTasks()

}
