import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-asso"
export default class extends Controller {
  static targets = ["inputrna", "results", "inputname", "output", "name", "address", "city", "description", "rna", "choice"]

  connect() {
    console.log(this.inputrnaTarget)
    console.log(this.inputnameTarget)
    // console.log(this.outputTarget)
  }

  rnadisplay(event) {
    event.preventDefault();
    const search = new FormData(this.inputrnaTarget)

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

  nameresults(event) {
    event.preventDefault();
    const search = new FormData(this.inputnameTarget)
    const query = search.get("nonprofit[name]")
    const url = `https://entreprise.data.gouv.fr/api/rna/v1/full_text/${query}`

    // this.outputTarget.classList.remove("d-none")
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        this.resultsTarget.innerHTML = '';
        console.log(data)
        data.association.forEach(association => association["titre_court"] !== null ?
        this.resultsTarget.insertAdjacentHTML('beforeend', `<li data-search-asso-target="choice" data-index="${data.association.indexOf(association)}">
                                              <h6>Nom : ${association["titre_court"]}</h6>
                                              <p>N° RNA :${association["id_association"]}
                                              </p><p>Ville : ${association["adresse_libelle_commune"]}
                                              </p>
                                              </li>`)
        : "");
        // this.nameTarget.value = data["association"][0]["titre_court"]
        // this.addressTarget.value = `${data["association"][0]['adresse_numero_voie']}, ${data["association"][0]['adresse_type_voie']} ${data["association"][0]['adresse_libelle_voie']}, ${data["association"][0]['adresse_code_postal']} ${data["association"][0]['adresse_libelle_commune']}`
        // this.cityTarget.value = data["association"][0]["adresse_libelle_commune"]
        // this.descriptionTarget.value = data["association"][0]["objet"]
        // this.rnaTarget.value = data["association"][0]["id_association"]
    })
  }

  namedisplay(event) {
    const search = new FormData(this.inputnameTarget)
    const query = search.get("nonprofit[name]")
    const url = `https://entreprise.data.gouv.fr/api/rna/v1/full_text/${query}`
    const index = this.choiceTarget.dataset.index
    this.outputTarget.classList.remove("d-none")
    this.resultsTarget.classList.add("d-none")
    fetch(url)
      .then(response => response.json())
      .then((data) => {
        this.nameTarget.value = data["association"][index]["titre_court"]
        this.addressTarget.value = `${data["association"][index]['adresse_numero_voie']}, ${data["association"][index]['adresse_type_voie']} ${data["association"][index]['adresse_libelle_voie']}, ${data["association"][index]['adresse_code_postal']} ${data["association"][index]['adresse_libelle_commune']}`
        this.cityTarget.value = data["association"][index]["adresse_libelle_commune"]
        this.descriptionTarget.value = data["association"][index]["objet"]
        this.rnaTarget.value = data["association"][index]["id_association"]
    })
  }

}
