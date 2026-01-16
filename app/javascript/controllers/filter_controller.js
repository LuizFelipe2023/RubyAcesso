import { Controller } from "@hotwired/stimulus"

const debounce = (func, wait) => {
  let timeout
  return function executedFunction(...args) {
    const later = () => {
      clearTimeout(timeout)
      func(...args)
    }
    clearTimeout(timeout)
    timeout = setTimeout(later, wait)
  }
}

export default class extends Controller {
  static targets = ["form", "input"]

 
  connect() {
   
    if (this.hasInputTarget) {
      this.inputTarget.addEventListener('input', this.submitDebounced.bind(this))
    }
  }


  disconnect() {
    if (this.hasInputTarget) {
      this.inputTarget.removeEventListener('input', this.submitDebounced.bind(this))
    }
  }


  submit(event) {
  
    if (event && event.type !== 'input' && event.type !== 'keyup') {
      event.preventDefault()
    }
    
    const form = this.formTarget
    if (form) {
     
      const pageInput = form.querySelector('input[name="page"]')
      if (pageInput) pageInput.remove()
      
      form.requestSubmit()
    }
  }


  submitDebounced = debounce((event) => {
    this.submit(event)
  }, 300)


  clear(event) {
    event.preventDefault()
    const form = this.formTarget
    if (form) {
     
      const input = form.querySelector('input[name="query"]')
      if (input) {
        input.value = ""
      }
      
      const pageInput = form.querySelector('input[name="page"]')
      if (pageInput) pageInput.remove()
    
      form.requestSubmit()
    }
  }
}