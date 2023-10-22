import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="toggle-paid"
export default class extends Controller {
  static targets = ["checkbox"];

  toggle() {
    const isChecked = this.checkboxTarget.checked;
    const url = this.data.get("url");

    console.log(isChecked)

    fetch(url, {
      method: "PUT",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": document.querySelector("[name=csrf-token]").content,
      },
      body: JSON.stringify({ paid: isChecked }),
    })
      .then(response => response.json())
      .then(data => {
        console.log("Updated record paid status:", data.paid);
      })
      .catch(error => {
        console.error("Error updating record:", error);
      });
  }
}
