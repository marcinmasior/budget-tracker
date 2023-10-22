import { Controller } from "@hotwired/stimulus"
import { Modal } from "bootstrap";

// Connects to data-controller="confirm"
export default class extends Controller {

  createModal(event) {
    event.preventDefault();

    const text = event.currentTarget.dataset.confirmText;

    const modalHTML = `
      <div class="modal fade" id="confirmationModal" tabindex="-1" aria-labelledby="confirmationModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="confirmationModalLabel">Confirmation</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">${text}</div>
            <div class="modal-footer">
              <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Cancel</button>
              <button type="button" class="btn btn-primary" data-action="confirm#submit">Delete</button>
            </div>
          </div>
        </div>
      </div>
    `;

    document.body.insertAdjacentHTML('beforeend', modalHTML);
    const modal = document.getElementById('confirmationModal');
    const bootstrapModal = new Modal(modal);
    bootstrapModal.show();

    modal.querySelector('button[data-action="confirm#submit"]').addEventListener('click', (e) => {
      this.submit();
    });

    modal.addEventListener('hidden.bs.modal', () => {
      modal.remove();
    });
  }

  submit() {
    this.element.closest('form').submit();
  }
}
