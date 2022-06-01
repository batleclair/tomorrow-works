import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="cards"
export default class extends Controller {
  static targets = ["card1", "card2", "card3", "button1", "button2", "button3"]
  connect() {
    console.log("Controller connected")
  }

  showCard1() {
    this.card1Target.classList.remove("disabled")
    this.card1Target.classList.add("activated")
    this.card2Target.classList.add("disabled")
    this.card2Target.classList.remove("activated")
    this.card3Target.classList.add("disabled")
    this.card3Target.classList.remove("activated")
  }

  showCard2() {
    this.card2Target.classList.add("activated")
    this.card2Target.classList.remove("disabled")
    this.card1Target.classList.add("disabled")
    this.card1Target.classList.remove("activated")
    this.card3Target.classList.add("disabled")
    this.card3Target.classList.remove("activated")
  }

  showCard3() {
    this.card3Target.classList.add("activated")
    this.card3Target.classList.remove("disabled")
    this.card1Target.classList.add("disabled")
    this.card1Target.classList.remove("activated")
    this.card2Target.classList.add("disabled")
    this.card2Target.classList.remove("activated")
  }
}
