import Vue from "vue/dist/vue.js";
import VueDraggable from "vue-draggable";
import Vue2Filters from "vue2-filters";
import VueResource from 'vue-resource'

Vue.use(VueResource)
Vue.use(VueDraggable);
Vue.use(Vue2Filters);


Vue.http.headers.common['X-CSRF-Token'] = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
Vue.http.headers.common['Authorization'] = 'Bearer TOKEN';

var element = document.getElementById('histories-form');

if(element != null)
{
    var histories = JSON.parse(element.dataset.histories);

    new Vue({
        el: element,
        mixins : [ Vue2Filters . mixin ],        
        data: {
            histories: histories,        
            options: {
                dropzoneSelector: 'ul',
                draggableSelector: 'li',
                // excludeOlderBrowsers: true,
                // showDropzoneAreas: true,
                // multipleDropzonesItemsDraggingEnabled: true,
                onDrop(event) {
                        //console.log(event);                
                        //console.log("id board origem: " + event.owner.id + " -- id board destino: " + event.droptarget.id + " -- id do history alterado: " + event.items[0].id);                
                    
                    if (event.owner.id != event.droptarget.id){                

                        Vue.http.get(/histories/+event.items[0].id).then(response =>{
                            //console.log(response.data);
                            var _history;                     
                            _history = response.data;
                            _history.status = event.droptarget.id;
                            //console.log(_history);

                            Vue.http.put('/histories/'+_history.id, {history: _history}).then(response => {     
                                //console.log("status alterado");
                                }, 
                                response => {
                                console.log(response);                            
                                }
                            );    

                        });                                
                    }                          
                },
                // onDragstart(event) {
                //   event.stop();
                // },
                onDragend(event) {
                    var status = event.droptarget.id;
                    var status_was = event.owner.id;
                    console.log(status + " " + status_was);
                    
                    if(status != status_was){
                        if (status == ""){
                            alert("Status não pode ser em branco");
                            event.stop();
                        }
                        else if (status_was == "Pending" && status != "Started"){
                            alert( "Status não pode pular mais de um status");
                            event.stop();
                        }
                        else if (status_was == "Started" && (status != "Pending" && status != "Delivered")){
                            alert("Status não pode pular mais de um status");           
                            event.stop();
                        }
                        else if (status_was == "Delivered" && (status != "Started" && status != "Accepted")){ 
                            alert("Status não pode pular mais de um status");
                            event.stop();
                        }
                        else if (status_was == "Accepted" && (status != "Delivered")){
                            alert("Status não pode pular mais de um status");                    
                            event.stop();          
                        }          
                    }
                }
            }
        },        
        template: ` 
        <div v-drag-and-drop:options="options"> 
            <div class="row">      
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-dark o-hidden h-100">    
                        <div class="card-header">
                            PENDING
                        </div>
                        <div class="card-body">            
                            <ul id='Pending' class="uledited list-group list-group-flush">                            
                                <li v-for="(history,key) in filterBy(histories,'Pending','status')" :id="history.id" class="list-group-item">{{ history.name }}</li>                            
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-dark o-hidden h-100">    
                        <div class="card-header">
                            STARTED
                        </div>        
                        <div class="card-body">            
                            <ul id='Started' class="uledited list-group list-group-flush">                            
                                <li v-for="(history,key) in filterBy(histories, 'Started','status')" :id="history.id" class="list-group-item">{{ history.name }}</li>                            
                            </ul>  
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-dark o-hidden h-100">    
                        <div class="card-header">
                            DELIVERED
                        </div>        
                        <div class="card-body">            
                            <ul id='Delivered' class="uledited list-group list-group-flush">                            
                                <li v-for="(history,key) in filterBy(histories,'Delivered','status')" :id="history.id" class="list-group-item">{{ history.name }}</li>                            
                            </ul>                 
                        </div>
                    </div>
                </div>
                <div class="col-xl-3 col-sm-6 mb-3">
                    <div class="card text-white bg-dark o-hidden h-100">    
                        <div class="card-header">
                            ACCEPTED
                        </div>        
                        <div class="card-body">            
                            <ul id='Accepted' class="uledited list-group list-group-flush">                            
                                <li v-for="(history,key) in filterBy(histories,'Accepted','status')" :id="history.id" class="list-group-item">{{ history.name }}</li>                            
                            </ul>         
                        </div>
                    </div>
                </div>
            </div>
        </div>
        `
    })
}