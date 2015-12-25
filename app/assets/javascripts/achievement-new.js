var achievementCreateListener;
achievementCreateListener = function() {
  $('.new-achievement-btn').click(function(e) {
    e.preventDefault();

    if (!$('.new-achievement-title').val()) {
      alert("Title field can't be blank");
      // swal({ title: "Name field can't be blank", type: "warning" });
    } else {
      if (!$('.new-achievement-description').val()) {
        alert("Description field can't be blank");
        // swal({ title: "Description field can't be blank", type: "warning" });
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
      alert("Achievement added successfully.");
      // swal("Achievement added successfully.", "", "success");
      window.location.reload();
    },
    error: function() {
      alert("Error, please try again.");
      // swal("Error, please try again.", "It is possible that you may already be registered for this course.", "error");
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
