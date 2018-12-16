import Vue from "vue/dist/vue.js";
import VueDraggable from "vue-draggable";

Vue.use(VueDraggable);

var element = document.getElementById('histories-form');

if(element != null)
{
    var histories = JSON.parse(element.dataset.histories);

    new Vue({
    el: element,
    data: {
        histories: histories,
        options: {
        // dropzoneSelector: 'ul',
        // draggableSelector: 'li',
        // excludeOlderBrowsers: true,
        // showDropzoneAreas: true,
        // multipleDropzonesItemsDraggingEnabled: true,
        // onDrop(event) {},
        // onDragstart(event) {
        //   event.stop();
        // },
        // onDragend(event) {
        //   event.stop();
        // }
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
                        <ul class="uledited list-group list-group-flush">
                            <div v-for="historie in histories.find_by status: 'Pending'" :key="historie.id">
                                <li class="list-group-item">{{ historie.name }}</li>
                            </div>                                                        
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
                        <ul class="uledited list-group list-group-flush"">
                            <li class="list-group-item">Item 1</li>
                            <li class="list-group-item">Item 2</li>
                            <li class="list-group-item">Item 3</li>
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
                        <ul class="uledited list-group list-group-flush"">
                            <li class="list-group-item">Item 1</li>
                            <li class="list-group-item">Item 2</li>
                            <li class="list-group-item">Item 3</li>
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
                        <ul class="uledited list-group list-group-flush"">
                            <li class="list-group-item">Item 1</li>
                            <li class="list-group-item">Item 2</li>
                            <li class="list-group-item">Item 3</li>
                        </ul>                            
                    </div>
                </div>
            </div>
        </div>
    </div>
    `
    }).$mount("#cards");
}