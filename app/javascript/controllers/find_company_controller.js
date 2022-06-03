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

    const query = search.get("company[siret]")
    const url = `https://entreprise.data.gouv.fr/api/sirene/v1/siren/${query}`
    console.log(url)
    this.outputTarget.classList.remove("d-none")
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        this.nameTarget.value = data["etablissement"]["nom_raison_sociale"]
        this.addressTarget.value = `${data["etablissement"]['l4_normalisee']}, ${data["etablissement"]['l6_normalisee']}`
        this.statusTarget.value = data["etablissement"]["libelle_nature_juridique_entreprise"]
        this.sectorTarget.value = data["etablissement"]["libelle_activite_principale_entreprise"]
        this.siretTarget.value = data["etablissement"]["siret"]
    })
  }
}
