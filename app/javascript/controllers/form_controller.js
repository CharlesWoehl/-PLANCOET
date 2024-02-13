import { Controller } from "@hotwired/stimulus"


export default class extends Controller {
  submit(event) {
    event.preventDefault(); // Empêche la soumission du formulaire par défaut

    let form = event.target;
    let formData = new FormData(form);
    let url = form.action;

    fetch(url, {
      method: 'POST',
      body: formData
    })
    .then(response => response.json())
    .then(data => {
      if (data.success) {
        form.classList.add('d-none'); // Cacher le formulaire
        document.getElementById('texteRemplacement').classList.remove('d-none'); // Afficher le texte de remplacement
      } else {
        // Gérer les erreurs si nécessaire
        console.log(data.errors);
      }
    })
    .catch(error => {
      // Gérer les erreurs AJAX si nécessaire
      console.error(error);
    });
  }
}
