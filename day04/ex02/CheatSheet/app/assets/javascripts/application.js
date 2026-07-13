document.addEventListener('DOMContentLoaded', function() {
  if (document.getElementById('quick-search-table')) {
    $('#quick-search-table').DataTable({
      pageLength: 10
    });
  }
});