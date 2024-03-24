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
    var formData = $(this).serialize();
    var url = $(this).attr('action');
    $.ajax({
      url: url,
      type: 'PATCH',
      data: formData,
      dataType: 'script'
    });
  });
});
