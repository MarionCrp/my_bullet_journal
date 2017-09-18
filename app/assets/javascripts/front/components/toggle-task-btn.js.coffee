Vue.component 'toggle-task-btn', {
  template: "#toggle-task-btn-template",
  props: {
    resourceUrl: String,
    day: Object,
    regular_task_category: Number
    taskDone: Boolean
  },
  data: -> {
    done: this.taskDone
  },
  watch: {
    taskDone: ->
      this.done = this.taskDone
  }
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
