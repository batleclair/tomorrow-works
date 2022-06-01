import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-asso"
export default class extends Controller {
  static targets = ["input", "output", "name", "address", "city", "description", "rna"]

  connect() {
    console.log(this.inputTarget)
    console.log(this.outputTarget)
    console.log(this.nameTarget.value)
  }

  display(event) {
    event.preventDefault();
    const form = new FormData(this.outputTarget)
    const search = new FormData(this.inputTarget)

    const query = search.get("nonprofit[siret]")
    const url = `https://entreprise.data.gouv.fr/api/rna/v1/id/${query}`
    this.outputTarget.classList.remove("d-none")
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        this.nameTarget.value = data["association"]["titre_court"]
        this.addressTarget.value = `${data["association"]['adresse_numero_voie']}, ${data["association"]['adresse_type_voie']} ${data["association"]['adresse_libelle_voie']}, ${data["association"]['adresse_code_postal']} ${data["association"]['adresse_libelle_commune']}`
        this.cityTarget.value = data["association"]["adresse_libelle_commune"]
        this.descriptionTarget.value = data["association"]["objet"]
        this.rnaTarget.value = data["association"]["id_association"]
    })
  }
}
