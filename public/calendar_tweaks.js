var ready = function() {
  var update_month = function() {
    $('.month span').html($('#currentDate1').text());
  }

  window.loaded_itv = setInterval(function() {
    if ($(".mv-container").length > 0) {
      clearInterval(window.loaded_itv);

      var month = $('<div></div>').addClass('month');
      var month_span = $('<span></span>');

      var prev = $('<a href="#"><i></i></a>').addClass('fa fa-caret-left');
      var next = $('<a href="#"><i></i></a>').addClass('fa fa-caret-right');

      prev.click(function() {
        $('#navBack1').click();
        update_month();
        return false;
      });

      next.click(function() {
        $('#navForward1').click();
        update_month();
        return false;
      });

      month.append(prev);
      month.append(month_span);
      month.append(next);
      $('body').prepend(month);

      update_month();
    }
  });
}

$(ready);