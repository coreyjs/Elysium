// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"

// app/javascript/packs/application.js (or wherever your JavaScript entry point is)

// Ensure you include this JavaScript file in your layout
document.addEventListener('DOMContentLoaded', () => {
    document.querySelectorAll('.add-narrative-series').forEach(button => {
        button.addEventListener('click', event => {
            const projectId = event.currentTarget.dataset.projectId;
            const narrativeSeriesGrid = event.currentTarget.closest('.narrative-series-grid');

            // Create new narrative series card
            const newNarrativeCard = document.createElement('div');
            newNarrativeCard.className = 'bg-gray-100 p-4 rounded-lg shadow-md';
            newNarrativeCard.innerHTML = `
        <h4 class="font-bold text-primary mb-2">New Narrative</h4>
        <p class="text-sm text-gray-700">Quests: 0</p>
      `;

            // Insert the new narrative card before the "+" button
            narrativeSeriesGrid.insertBefore(newNarrativeCard, event.currentTarget);

            // Optionally, send an AJAX request to your Rails backend to persist the new narrative series
            // Example (using fetch API):
            fetch(`/projects/${projectId}/narrative_series`, {
              method: 'POST',
              headers: {
                'Content-Type': 'application/json',
                'X-CSRF-Token': document.querySelector('meta[name="csrf-token"]').getAttribute('content')
              },
              body: JSON.stringify({narrative_series: { title: 'New Narrative' }})
            })
            .then(response => response.json())
            .then(data => {
              console.log('New narrative series created:', data);
            })
            .catch(error => {
              console.error('Error creating new narrative series:', error);
            });
        });
    });
});
