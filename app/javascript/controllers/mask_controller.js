import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = { type: String }

  connect() {
    this.applyMask()
  }

  applyMask() {
    this.element.addEventListener("input", () => {
      const type = this.typeValue
      let value = this.element.value.replace(/\D/g, "") 

      if (type === "cpf") {
        value = value.slice(0, 11)
        value = value.replace(/(\d{3})(\d)/, "$1.$2")
        value = value.replace(/(\d{3})(\d)/, "$1.$2")
        value = value.replace(/(\d{3})(\d{1,2})$/, "$1-$2")
      }

      if (type === "telefone") {
        value = value.slice(0, 11)
        value = value.replace(/(\d{2})(\d)/, "($1) $2")
        if (value.length <= 14) value = value.replace(/(\d{4})(\d)/, "$1-$2")
        else value = value.replace(/(\d{5})(\d)/, "$1-$2")
      }

      this.element.value = value
    })

   
    const form = this.element.closest("form")
    if (form) {
      form.addEventListener("submit", () => {
        this.element.value = this.element.value.replace(/\D/g, "") 
      })
    }
  }
}
