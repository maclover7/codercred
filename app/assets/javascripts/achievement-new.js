var achievementCreateListener;
achievementCreateListener = function() {
  $('.new-achievement-btn').click(function(e) {
    e.preventDefault();

    if (!$('.new-achievement-title').val()) {
      swal({ title: "Title field can't be blank", type: "warning" });
    } else {
      if (!$('.new-achievement-description').val()) {
        swal({ title: "Description field can't be blank", type: "warning" });
      } else {
        $('.new-achievement-btn').prop('disabled', true);
        sendAchievement();
      }
    }
  });

  $('.new-achievement-close').click(function() {
    clearInput();
  })
};

function sendAchievement() {
  $.ajax({
    type: "POST",
    url: ('/achievements'),
    data: $('#new-achievement-form').serialize(),
    dataType: 'json',
    success: function() {
      $('#newAchievement').modal('hide');
      hideButton();
      clearInput();
      $('.new-achievement-btn').prop('disabled', false);
      swal("Achievement added successfully.", "", "success");
      window.location.reload();
    },
    error: function() {
      swal("Error, please try again.", "", "error");
      $('.new-achievement-btn').prop('disabled', false);
    }
  })
}

$(document).ready(achievementCreateListener);
$(document).on("page:load", achievementCreateListener);

// CREATE HELPER FUNCTIONS

function hideButton() {
  var button = $("#new-achievement-toggler");
  button.hide();
}

function clearInput() {
  $('.new-achievement-name').val("");
  $('.new-achievement-description').val("");
}
