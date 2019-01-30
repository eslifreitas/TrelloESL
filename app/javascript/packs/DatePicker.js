import Vue from "vue/dist/vue.js";
import { setupCalendar, Calendar, DatePicker, Popover } from 'v-calendar';

// Call setupCalendar and pass in optional defaults
setupCalendar({
  firstDayOfWeek: 2 // Use Monday instead of Sunday as first day of the week
});
Vue.component('v-calendar', Calendar);
Vue.component('v-datepicker', Calendar.DatePicker);
