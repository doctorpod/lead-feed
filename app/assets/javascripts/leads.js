// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/
function check_hide_won() {
  if ($("#hide_won:checked").size() > 0) {
    $("tr.won").hide();
  } else {
    $("tr.won").show();
  }
}

function check_hide_dead() {
  if ($("#hide_dead:checked").size() > 0) {
    $("tr.dead").hide();
  } else {
    $("tr.dead").show();
  }
}

$(document).ready(function() {
  if ($("#hide_won").size() > 0) {
    check_hide_won();
    $("#hide_won").change(check_hide_won);
  }
  if ($("#hide_dead").size() > 0) {
    check_hide_dead();
    $("#hide_dead").change(check_hide_dead);
  }
})