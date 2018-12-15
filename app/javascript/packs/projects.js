import Vue from 'vue/dist/vue.esm'
import TurbolinksAdapter from 'vue-turbolinks'
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(TurbolinksAdapter)

document.addEventListener('turbolinks:load',() => 
{
  Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
  Vue.http.headers.common['Authorization'] = 'Bearer TOKEN';

  var element = document.getElementById('project-form');

  if(element != null)
  {
    var project = JSON.parse(element.dataset.project);

    var app = new Vue(
    {
      el: element,
      data() {
        return{
          errors: [],          
          project: project
        }
      },
      methods: {
        saveProject: function(e) {   
          if (project.id == null){
            this.$http.post('/projects', {project: this.project}).then(response => {                       
              this.project = response.data;              
              Turbolinks.visit('/projects/'+this.project.id)                                     
              }, 
              response => {
                console.log(response)
              }
            )
          }
          else {
            this.$http.put('/projects/'+project.id, {project: this.project}).then(response => {     
              this.project = response.data;        
              Turbolinks.visit('/projects/'+this.project.id);
              }, 
              response => {
                console.log(response)
              }
            )
          }
        },
        validateProject: function(){
          this.errors = [];
          
          if(!this.project.name) {            
            this.errors.push("Nome obrigatório");                     
          }

          if(!this.project.manager_id){            
            this.errors.push("Gerente obrigatório");
          }

          if(!this.errors.length){            
            return true;
          }
        }
      }    
    });
  }
});