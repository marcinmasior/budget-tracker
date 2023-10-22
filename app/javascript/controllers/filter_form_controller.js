import { Controller } from "@hotwired/stimulus"
import { debounce } from "lodash";

// Connects to data-controller="filter-form"
export default class extends Controller {
  static targets = ["form"];

  connect() {
    console.log("Working")
    this.submitForm = debounce(this.submitForm, 300);
  }

  submitForm() {
    this.formTarget.submit();
  }
}