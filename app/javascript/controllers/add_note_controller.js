import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="add-note"
export default class extends Controller {
  static targets = ["form", "list", "comment", "editform", "content"]

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

  editor(event) {
    event.preventDefault()
    this.commentTarget.classList.add("d-none")
    this.editformTarget.parentNode.classList.remove("d-none")
  }

  edit(event) {
    const token = document.querySelector("[name='csrf-token']").content
    event.preventDefault()
    const url = this.editformTarget.action
    const form = new FormData(this.editformTarget)
    const note = form.get("candidature_note[content]")
    fetch(url, {
      method: "PATCH",
      headers: {"Content-Type": "application/json", "X-CSRF-Token": token },
      body: JSON.stringify({content: note})
    })
      .then(response => response.json())
      .then((data) => {
        this.contentTarget.innerHTML = data["content"]
      })
    this.commentTarget.classList.remove("d-none")
    this.editformTarget.parentNode.outerHTML.delete
  }

  append(data) {
    this.listTarget.insertAdjacentHTML("afterBegin",
    `<div class="mb-2 p-2 white-rounded-background" data-add-note-target="comment" data-note-id=${data["id"]}>
    <div>
      <p class="m-0">${data["content"]}</p>
      <div class="d-flex justify-content-between">
        <p class="m-0 small-grey-text">${data["author"]} | <i>${data["created_at"]}</i></p>
        <ul class="mb-0 list-inline">
          <button type="button" class="clean-button" data-action="click->add-note#editor">
            <i class="fa-solid fa-pen-to-square small-grey-text"></i>
          </button>
          <button type="button" class="clean-button" data-action="click->add-note#delete">
            <i class="fa-solid fa-trash small-grey-text"></i>
          </button>
        </ul>
      </div>
    </div>
  </div>`
  )
  }
}
