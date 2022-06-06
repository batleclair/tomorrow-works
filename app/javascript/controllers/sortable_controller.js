import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

// Connects to data-controller="sortable"
export default class extends Controller {
  static targets = ["nouveau", "etape1", "etape2", "validation", "dropped", "validationstatus"]

  connect() {
    console.log("sortable controller connected")
    const token = document.querySelector("[name='csrf-token']").content

    Sortable.create(this.nouveauTarget, {
      group: 'shared',
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        const status = event.to.dataset.sortableTarget
        const cards = event.to.querySelectorAll('div')
        const index = event.newDraggableIndex
        const card = cards[index]
        const candidatureId = card.dataset.candidatureId
        const offerId = card.dataset.offerId
        const url = `/offers/${offerId}/candidatures/${candidatureId}`
        fetch(url, {
          method: "PATCH",
          headers: {"Content-Type": "application/json", "X-CSRF-Token": token },
          body: JSON.stringify({status: status})
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
            this.nouveauTarget.parentNode.querySelector('strong').innerHTML = data.nouveau
            this.etape1Target.parentNode.querySelector('strong').innerHTML = data.etape1
            this.etape2Target.parentNode.querySelector('strong').innerHTML = data.etape2
            this.validationTarget.parentNode.querySelector('strong').innerHTML = data.validation
            this.droppedTarget.parentNode.querySelector('strong').innerHTML = data.dropped

          })
        // alert(`${event.from} moved to ${event.to}`)
      }
    });

    Sortable.create(this.etape1Target, {
      group: 'shared',
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        const status = event.to.dataset.sortableTarget
        const cards = event.to.querySelectorAll('div')
        const index = event.newDraggableIndex
        const card = cards[index]
        const candidatureId = card.dataset.candidatureId
        const offerId = card.dataset.offerId
        const url = `/offers/${offerId}/candidatures/${candidatureId}`
        fetch(url, {
          method: "PATCH",
          headers: {"Content-Type": "application/json", "X-CSRF-Token": token },
          body: JSON.stringify({status: status})
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
            this.nouveauTarget.parentNode.querySelector('strong').innerHTML = data.nouveau
            this.etape1Target.parentNode.querySelector('strong').innerHTML = data.etape1
            this.etape2Target.parentNode.querySelector('strong').innerHTML = data.etape2
            this.validationTarget.parentNode.querySelector('strong').innerHTML = data.validation
            this.droppedTarget.parentNode.querySelector('strong').innerHTML = data.dropped
          })
        // alert(`${event.from} moved to ${event.to}`)
      }
    });

    Sortable.create(this.etape2Target, {
      group: 'shared',
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        const status = event.to.dataset.sortableTarget
        const cards = event.to.querySelectorAll('div')
        const index = event.newDraggableIndex
        const card = cards[index]
        const candidatureId = card.dataset.candidatureId
        const offerId = card.dataset.offerId
        const url = `/offers/${offerId}/candidatures/${candidatureId}`
        fetch(url, {
          method: "PATCH",
          headers: {"Content-Type": "application/json", "X-CSRF-Token": token },
          body: JSON.stringify({status: status})
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
            this.nouveauTarget.parentNode.querySelector('strong').innerHTML = data.nouveau
            this.etape1Target.parentNode.querySelector('strong').innerHTML = data.etape1
            this.etape2Target.parentNode.querySelector('strong').innerHTML = data.etape2
            this.validationTarget.parentNode.querySelector('strong').innerHTML = data.validation
            this.droppedTarget.parentNode.querySelector('strong').innerHTML = data.dropped
          })
        // alert(`${event.from} moved to ${event.to}`)
      }
    });

    Sortable.create(this.validationTarget, {
      group: 'shared',
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        const status = event.to.dataset.sortableTarget
        const cards = event.to.querySelectorAll('div')
        const index = event.newDraggableIndex
        const card = cards[index]
        const candidatureId = card.dataset.candidatureId
        const offerId = card.dataset.offerId
        const url = `/offers/${offerId}/candidatures/${candidatureId}`
        fetch(url, {
          method: "PATCH",
          headers: {"Content-Type": "application/json", "X-CSRF-Token": token },
          body: JSON.stringify({status: status})
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
            this.nouveauTarget.parentNode.querySelector('strong').innerHTML = data.nouveau
            this.etape1Target.parentNode.querySelector('strong').innerHTML = data.etape1
            this.etape2Target.parentNode.querySelector('strong').innerHTML = data.etape2
            this.validationTarget.parentNode.querySelector('strong').innerHTML = data.validation
            this.droppedTarget.parentNode.querySelector('strong').innerHTML = data.dropped
          })
        // alert(`${event.from} moved to ${event.to}`)
      }
    });

    Sortable.create(this.droppedTarget, {
      group: 'shared',
      ghostClass: "ghost",
      animation: 150,
      onEnd: (event) => {
        const status = event.to.dataset.sortableTarget
        const cards = event.to.querySelectorAll('div')
        const index = event.newDraggableIndex
        const card = cards[index]
        const candidatureId = card.dataset.candidatureId
        const offerId = card.dataset.offerId
        const url = `/offers/${offerId}/candidatures/${candidatureId}`
        fetch(url, {
          method: "PATCH",
          headers: {"Content-Type": "application/json", "X-CSRF-Token": token },
          body: JSON.stringify({status: status})
        })
          .then(response => response.json())
          .then((data) => {
            console.log(data)
            this.nouveauTarget.parentNode.querySelector('strong').innerHTML = data.nouveau
            this.etape1Target.parentNode.querySelector('strong').innerHTML = data.etape1
            this.etape2Target.parentNode.querySelector('strong').innerHTML = data.etape2
            this.validationTarget.parentNode.querySelector('strong').innerHTML = data.validation
            this.droppedTarget.parentNode.querySelector('strong').innerHTML = data.dropped
          })
        // alert(`${event.from} moved to ${event.to}`)
      }
    });

  }
}
