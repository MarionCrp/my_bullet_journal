Vue.component 'toggle-task-btn', {
  template: "#toggle-task-btn-template",
  props: {
    resourceUrl: String,
    day: Object,
    regular_task_category: Number
  },
  data: -> {
    resource: Vue.resource("#{this.resourceUrl}{/id}"),
    done: this.day.categories.includes(this.regular_task_category)
  },
  computed: {
    taskParams: ->
      {
        regular_task: {
          category_id: this.regular_task_category,
          date: this.day.date
        }
      }
  },
  methods: {
    toggleDone: ->
      this.$http.get(this.resourceUrl, params: this.taskParams).then (response) ->
        this.done = response.body.done
  }
}
