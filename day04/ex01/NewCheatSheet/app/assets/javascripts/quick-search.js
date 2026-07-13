document.addEventListener('DOMContentLoaded', function() {
  if (document.getElementById('quick-search-table')) {
    $('#quick-search-table').DataTable({
      pageLength: 10,           
      lengthMenu: [5, 10, 25, 50], 
      language: {
        search: "Rechercher :",
        info: "Affichage de _START_ à _END_ sur _TOTAL_ entrées",
        infoEmpty: "Aucune donnée disponible",
        infoFiltered: "(filtré de _MAX_ entrées totales)",
        paginate: {
          first: "Premier",
          last: "Dernier",
          next: "Suivant",
          previous: "Précédent"
        }
      }
    });
  }
});