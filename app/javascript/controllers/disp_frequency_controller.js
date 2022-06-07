import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="disp-frequency"
export default class extends Controller {
  static targets= ["valueFreq", "output" ]
  connect() {
    console.log("hello")
    this.outputTarget.innerHTML = `${this.valueFreqTarget.value} demi-journée(s)`
  }

  change() {
    this.outputTarget.innerHTML = `${this.valueFreqTarget.value} demi-journée(s)`
  }
}
