$(document).ready(function() {
  $('.edit-user-btn').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'script'
    });
  });

  $(document).on('submit', '.edit-user-form', function(e) {
    e.preventDefault();
    let formData = new FormData(this)
    let url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'PATCH',
      data: formData,
      contentType: false, // Set contentType to false when using FormData
      processData: false,
      dataType: 'script'
    });
  });
});

