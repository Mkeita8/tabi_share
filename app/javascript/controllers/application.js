import { Application } from "@hotwired/stimulus"
import $ from "jquery";

const application = Application.start()

// Configure Stimulus development experience
application.debug = false
window.Stimulus   = application

export { application }

$(document).on("turbo:load", function () {
    setTimeout(() => {
      $(".flash-message, .error-messages").fadeOut(1000, function () {
        $(this).remove();
      });
    }, 4000);
  });