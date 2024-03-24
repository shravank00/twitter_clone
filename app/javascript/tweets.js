$(document).ready(function() {
  $('#new-tweet-form').submit(function(e) {
    e.preventDefault(); // Prevent default form submission
    var formData = $(this).serialize(); // Serialize form data
    var url = $(this).attr('action'); // Get form action URL
    var token = $('meta[name="csrf-token"]').attr('content'); // Get CSRF token from meta tag
    $.ajax({
      url: url,
      type: 'POST',
      data: formData,
      dataType: 'script', // Specify expected response data type
      headers: {
        'X-CSRF-Token': token // Set CSRF token in request header
      }
    });
  });

  $('.delete-tweet').on('click', function(e) {
    e.preventDefault(); // Prevent default link behavior
    var url = $(this).attr('href'); // Get the URL from the link's "href" attribute
    var token = $('meta[name="csrf-token"]').attr('content'); // Get CSRF token from meta tag
    $.ajax({
      url: url,
      type: 'DELETE',
      dataType: 'script', // Specify expected response data type
      headers: {
        'X-CSRF-Token': token // Set CSRF token in request header
      }
    });
  });

  $('.edit-tweet-btn').on('click', function(e) {
    e.preventDefault();
    var url = $(this).attr('href');
    $.ajax({
      url: url,
      type: 'GET',
      dataType: 'script'
    });
  });

  $(document).on('submit', '.edit-tweet-form', function(e) {
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
