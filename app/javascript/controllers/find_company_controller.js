import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-asso"
export default class extends Controller {
  static targets = ["input", "output", "sector", "name", "address", "status", "siret", "results", "choice"]

  connect() {
    console.log(this.inputTarget)
    console.log(this.outputTarget)
    console.log(this.nameTarget)
  }

  results(event) {
    event.preventDefault();
    this.resultsTarget.classList.remove("d-none")
    const search = new FormData(this.inputTarget)
    const query = search.get("company[name]")
    const url = `https://recherche-entreprises.api.gouv.fr/search?q=${query}`

    // this.outputTarget.classList.remove("d-none")
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        this.resultsTarget.innerHTML = '';
        console.log(data)
        data.results.forEach(company => company["nom_raison_sociale"] !== null ?
          this.resultsTarget.insertAdjacentHTML('beforeend', `<li data-find-company-target="choice" data-index="${data.results.indexOf(company)}">
                                            <h6>Nom : ${company["nom_raison_sociale"]}</h6>
                                            <p>N° SIREN :${company["siren"]}</p>
                                            <p>Addresse : ${company["siege"]['numero_voie']} ${company["siege"]['type_voie']} ${company["siege"]['libelle_voie']}, ${company["siege"]['code_postal']}, ${company["siege"]['libelle_commune']}</p>
                                          </li>`)
          : "");
    })
  }

  display(event) {
    event.preventDefault();
    const search = new FormData(this.inputTarget)
    const query = search.get("company[name]")
    const url = `https://recherche-entreprises.api.gouv.fr/search?q=${query}`
    const index = this.choiceTarget.dataset.index
    this.outputTarget.classList.remove("d-none")
    this.resultsTarget.classList.add("d-none")
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        data = data["results"][index]
        this.nameTarget.value = data["nom_raison_sociale"]
        this.addressTarget.value = `${data["siege"]['numero_voie']} ${data["siege"]['type_voie']} ${data["siege"]['libelle_voie']}, ${data["siege"]['code_postal']}, ${data["siege"]['libelle_commune']}`
        this.siretTarget.value = data["siren"]
    })
  }

}
