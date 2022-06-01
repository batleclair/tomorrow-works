import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-asso"
export default class extends Controller {
  static targets = ["input", "output"]

  connect() {
    console.log(this.inputTarget)
    console.log(this.outputTarget)
  }

  display(event) {
    event.preventDefault();
    const form = new FormData(this.outputTarget)
    const search = new FormData(this.inputTarget)
    const query = search.get("association[siret]")
    const url = `https://entreprise.data.gouv.fr/api/rna/v1/id/${query}`
    this.outputTarget.classList.remove("d-none")
    form.set("association[name]", "COUCOU")
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        console.log(data["association"]["titre_court"])
    })
  }
}
