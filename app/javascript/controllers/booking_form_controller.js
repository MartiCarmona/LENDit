// app/javascript/controllers/booking-form_controller.js
import { Controller } from 'stimulus';

export default class extends Controller {
  static targets = ['startDate', 'endDate', 'submitButton'];

  connect() {
    this.validateDates();
  }

  validateDates() {
    console.log('Validating dates')
    const startDate = new Date(this.startDateTarget.value);
    const endDate = new Date(this.endDateTarget.value);

    if (!this.startDateTarget.value || !this.endDateTarget.value || startDate >= endDate) {
      this.submitButtonTarget.disabled = true;
    } else {
      this.submitButtonTarget.disabled = false;
    }
  }
}
