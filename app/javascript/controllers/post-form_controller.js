import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "body", "characterCount" ]

    initialize() {
      this.update()
    }
  
    update() {
      var count = this.bodyTarget.value.length
      
      var message = `${count} characters`
      
  
      this.characterCountTarget.textContent = message
  
      if (count > 900) {
        this.characterCountTarget.classList.remove("has-text-success")
        this.characterCountTarget.classList.add("has-text-weight-bold")
        this.characterCountTarget.classList.add("has-text-danger")
      } 
      else {
        this.characterCountTarget.classList.add("has-text-success")
      }
    }
  
    submit(event) {
      var count = this.bodyTarget.value.length
      if (count > 1000) {
        event.preventDefault()
      }
    }
}