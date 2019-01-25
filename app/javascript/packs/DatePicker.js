import Vue from "vue/dist/vue.js";
import { setupCalendar, Calendar, DatePicker, Popover } from 'v-calendar';
import VueResource from 'vue-resource'
import TurbolinksAdapter from 'vue-turbolinks'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

// Call setupCalendar and pass in optional defaults
setupCalendar({
  firstDayOfWeek: 2 // Use Monday instead of Sunday as first day of the week

});
//Vue.component('v-calendar', Calendar);
//Vue.component('v-datepicker', Calendar.DatePicker);

document.addEventListener('turbolinks:load', () => {
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  Vue.http.headers.common['Authorization'] = 'Bearer TOKEN';

  var element = document.getElementById('history-form');

  if (element != null) {
    
    var history = JSON.parse(element.dataset.history);

    var app = new Vue(
    {
      el: element,
      data() {
        return {
          value: null,
          history: history
        }
      },
      methods: {
        saveHistory: function (e) {          
          if (history.id == null) {
            this.$http.post('/histories', { history: this.history }).then(response => {
              this.history = response.data;
              //Turbolinks.visit('/projects/' + this.project.id)
            },
              response => {
                console.log(response)
              }
            )
          }
          else {
            this.$http.put('/histories/' + history.id, { history: this.history }).then(response => {
              this.history = response.data;
              //Turbolinks.visit('/projects/' + this.project.id);
            },
              response => {
                console.log(response)
              }
            )
          }
        }
      },
      components: {
        'v-calendar': Calendar,
        'v-datepicker': DatePicker
      },
    });
  }
});