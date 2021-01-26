// Visit The Stimulus Handbook for more details 
// https://stimulusjs.org/handbook/introduction
// 
// This example controller works with specially annotated HTML like:
//
// <div data-controller="hello">
//   <h1 data-target="hello.output"></h1>
// </div>

import { Controller } from "stimulus"
import Sortable from "sortablejs"
import Rails from "@rails/ujs"

export default class extends Controller {
  connect() {
    this.sortable = Sortable.create(this.element, {
      group: {
        name: 'card',
        pull: ['card'],
        put: ['card']
      },
    	onEnd: this.end.bind(this)
    })
  }

  end(event) {
  	let id = event.item.dataset.id
    var idColumnTo = event.to.dataset.column
  	let data = new FormData()

  	data.append("position", event.newIndex + 1)

  	Rails.ajax({
  		url: event.item.dataset.dragUrl.replace(":id", id).replace(":column_id", idColumnTo),
  		type: 'PATCH',
  		data: data
  	})
  }
}
