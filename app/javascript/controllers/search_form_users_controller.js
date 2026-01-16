import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["form", "input", "select"]
  static values = { 
    delay: { type: Number, default: 300 },
    loading: { type: Boolean, default: false }
  }

  connect() {
    this.timeout = null
  }

  disconnect() {
    this.clearTimeout()
  }

 
  search() {
    this.clearTimeout()
    
    this.timeout = setTimeout(() => {
      this.submitForm()
    }, this.delayValue)
  }

  
  clear(event) {
    event?.preventDefault()
    
    if (this.hasInputTarget) {
      this.inputTarget.value = ''
    }
   
    this.submitForm()
  }

 
  submitForm() {
    this.loadingValue = true
    
   
    this.element.classList.add('searching')
    
   
    this.formTarget.requestSubmit()
  }

 
  sort(event) {
    event.preventDefault()
    const field = event.currentTarget.dataset.sortField
    const direction = event.currentTarget.dataset.sortDirection || 'asc'
    
  
    this.addHiddenInput('sort', field)
    this.addHiddenInput('direction', direction)
    
    this.submitForm()
  }

 
  addHiddenInput(name, value) {
   
    const existingInput = this.formTarget.querySelector(`input[name="${name}"]`)
    if (existingInput) {
      existingInput.remove()
    }
    
    
    const input = document.createElement('input')
    input.type = 'hidden'
    input.name = name
    input.value = value
    this.formTarget.appendChild(input)
  }

  clearTimeout() {
    if (this.timeout) {
      clearTimeout(this.timeout)
      this.timeout = null
    }
  }

  loadingValueChanged() {
    if (this.loadingValue) {
      this.element.classList.add('opacity-50', 'cursor-wait')
    } else {
      this.element.classList.remove('opacity-50', 'cursor-wait')
    }
  }
}