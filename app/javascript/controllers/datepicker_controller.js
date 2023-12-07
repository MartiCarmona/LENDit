import { Controller } from "@hotwired/stimulus"
import flatpickr from "flatpickr"

export default class extends Controller {
  static values = {
    disabledDates: Array
  }
  connect() {
    console.log(this.disabledDatesValue)
    flatpickr(this.element, { dateFormat: "Y-m-d", disable: this.disabledDatesValue })
  }
}
