import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-asso"
export default class extends Controller {
  static targets = ["input", "output", "sector", "name", "address", "status", "siret"]

  connect() {
    console.log(this.inputTarget)
    console.log(this.outputTarget)
    console.log(this.nameTarget)
  }

  display(event) {
    event.preventDefault();
    const search = new FormData(this.inputTarget)

    const query = search.get("company[name]")
    const url = `https://recherche-entreprises.api.gouv.fr/search?q=${query}`
    console.log(url)
    this.outputTarget.classList.remove("d-none")
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        data = data["results"][0]
        this.nameTarget.value = data["nom_raison_sociale"]
        this.addressTarget.value = `${data["siege"]['numero_voie']} ${data["siege"]['type_voie']} ${data["siege"]['libelle_voie']}, ${data["siege"]['code_postal']}, ${data["siege"]['libelle_commune']}`
        this.siretTarget.value = data["siren"]
    })
  }
}
