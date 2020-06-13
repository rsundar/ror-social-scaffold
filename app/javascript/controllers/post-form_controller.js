import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "body", "characterCount" ]

    initialize() {
      this.update()
    }
  
    update() {
      var count = this.bodyTarget.value.length
      var max = this.maximum
      var message = `${count}%`
      
      this.characterCountTarget.value = `${count}`
      this.characterCountTarget.textContent = message
  
      if (count > (0.9 * max)) {
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
      var max = this.maximum
      if (count > max) {
        event.preventDefault()
      }
    }

    get maximum() {
      if(this.data.has("maximum")) {
        return this.data.get("maximum")
      } else {
        return 1000
      }
    }
}