import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-note"
export default class extends Controller {
  static targets = ["form", "list", "comment"]

  connect() {
  }

  add(event) {
    const token = document.querySelector("[name='csrf-token']").content
    event.preventDefault()
    const url = this.formTarget.action
    const form = new FormData(this.formTarget)
    const note = form.get("candidature_note[content]")
    fetch(url, {
      method: "POST",
      headers: {"Content-Type": "application/json", "X-CSRF-Token": token },
      body: JSON.stringify({content: note})
    })
      .then(response => response.json())
      .then((data) => {
        this.append(data)
      })
    this.formTarget.querySelector('textarea').value = ""
  }

  delete(event) {
    const token = document.querySelector("[name='csrf-token']").content
    event.preventDefault()
    const id = this.commentTarget.dataset.noteId
    const url =`/candidature_notes/${id}`
    fetch(url, {
      method: "DELETE",
      headers: {"Content-Type": "application/json", "X-CSRF-Token": token },
      body: JSON.stringify({id: id})
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
      })
    this.commentTarget.classList.add("d-none")
  }


  append(data) {
    this.listTarget.insertAdjacentHTML("afterBegin",
    `<div class="mb-2 p-2 white-rounded-background" data-add-note-target="comment" data-note-id=${data["id"]}>
    <div>
      <p class="m-0">${data["content"]}</p>
      <div class="d-flex justify-content-between">
        <p class="m-0 small-grey-text">${data["author"]} | <i>${data["created_at"]}</i></p>
        <ul class="mb-0 list-inline">
          <button type="button" class="clean-button" data-bs-toggle="modal" data-bs-target="#editModal">
            <i class="fa-solid fa-pen-to-square small-grey-text"></i>
          </button>
          <button type="button" class="clean-button">
            <i class="fa-solid fa-trash small-grey-text" data-action="click->add-note#delete"></i>
          </button>
        </ul>
      </div>
    </div>
  </div>`)
  }
}
