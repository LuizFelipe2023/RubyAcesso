import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["userMenu", "mobileMenu", "userButton", "mobileButton"]

 
  toggleUserMenu(event) {
    event.preventDefault()
    event.stopPropagation()
    this.userMenuTarget.classList.toggle("hidden")
    
    
    if (!this.mobileMenuTarget.classList.contains("hidden")) {
      this.mobileMenuTarget.classList.add("hidden")
    }
  }

 
  toggleMobileMenu(event) {
    event.preventDefault()
    event.stopPropagation()
    this.mobileMenuTarget.classList.toggle("hidden")
    
    
    if (!this.userMenuTarget.classList.contains("hidden")) {
      this.userMenuTarget.classList.add("hidden")
    }
  }

 
  closeAllMenus() {
    this.userMenuTarget.classList.add("hidden")
    this.mobileMenuTarget.classList.add("hidden")
  }

 
  handleClickOutside(event) {
   
    if (!this.element.contains(event.target) || 
        (event.target !== this.userButtonTarget && !this.userButtonTarget.contains(event.target)) ||
        (event.target !== this.mobileButtonTarget && !this.mobileButtonTarget.contains(event.target))) {
      this.closeAllMenus()
    }
  }

 
  handleEscapeKey(event) {
    if (event.key === "Escape") {
      this.closeAllMenus()
    }
  }

  connect() {
    this.handleClickOutsideBound = this.handleClickOutside.bind(this)
    this.handleEscapeKeyBound = this.handleEscapeKey.bind(this)
    
    document.addEventListener("click", this.handleClickOutsideBound)
    document.addEventListener("keydown", this.handleEscapeKeyBound)
  }

  // Remove os listeners ao desconectar
  disconnect() {
    document.removeEventListener("click", this.handleClickOutsideBound)
    document.removeEventListener("keydown", this.handleEscapeKeyBound)
  }
}