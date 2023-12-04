import { Application } from "@hotwired/stimulus"

const application = Application.start()

application.debug = false
window.Stimulus   = application

export { application }

import 'controllers';

document.addEventListener('DOMContentLoaded', function() {
  // Find the elements
  var mapTrigger = document.getElementById('map-trigger');
  var mapContainer = document.querySelector('.map-container');

  // Check if both elements exist
  if (mapTrigger && mapContainer) {
    // Add click event listener
    mapTrigger.addEventListener('click', function() {
      // Toggle the display of the map container
      if (mapContainer.style.display === 'none' || mapContainer.style.display === '') {
        mapContainer.style.display = 'block';
      } else {
        mapContainer.style.display = 'none';
      }
    });
  }
});
