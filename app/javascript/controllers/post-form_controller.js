import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "body", "characterCount" ]

    initialize() {
      this.update()
    }
  
    update() {
      var count = this.bodyTarget.value.length
      
      var message = `${count}%`
      
      this.characterCountTarget.value = `${count}`
      this.characterCountTarget.textContent = message
  
      if (count > 900) {
        this.characterCountTarget.classList.remove("is-success")
        this.characterCountTarget.classList.add("is-danger")
      } 
      else {
        this.characterCountTarget.classList.remove("is-danger")
        this.characterCountTarget.classList.add("is-success")
      }
    }
  
    submit(event) {
      var count = this.bodyTarget.value.length
      if (count > 1000) {
        event.preventDefault()
      }
    }
}