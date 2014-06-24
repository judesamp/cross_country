(function() {
  $(function() {
    $('#delete_button').on('click', function() {});
    $(document).on("click", "#edit_button", function() {
      var run_id;
      run_id = $(this).attr('data-run-id');
      return $.ajax('/runs/' + run_id + "/edit", {
        type: 'GET'
      });
    });
    $(document).on("click", "#fade", function() {
      $("#fade").hide();
      $(".modal_custom").hide();
    });
    $(document).on("click", ".close", function() {
      $("#fade").hide();
      $(".modal_custom").hide();
    });
    $(document).on("click", "#last_seven", function(e) {
      var value;
      e.preventDefault();
      value = $(this).attr('id');
      $.ajax('/runs/filter', {
        type: 'GET',
        data: {
          "filter": {
            "type": value
          }
        }
      });
    });
    $(document).on("click", "#last_thirty", function(e) {
      var value;
      e.preventDefault();
      value = $(this).attr('id');
      $.ajax('/runs/filter', {
        type: 'GET',
        data: {
          "filter": {
            "type": value
          }
        }
      });
    });
    $(document).on("click", "#year", function(e) {
      var value;
      e.preventDefault();
      value = $(this).attr('id');
      $.ajax('/runs/filter', {
        type: 'GET',
        data: {
          "filter": {
            "type": value
          }
        }
      });
    });
    $(document).on("click", "#lifetime", function(e) {
      var value;
      e.preventDefault();
      value = $(this).attr('id');
      $.ajax('/runs/filter', {
        type: 'GET',
        data: {
          "filter": {
            "type": value
          }
        }
      });
    });
    $(document).on("submit", "#new_run", function(e) {
      return $('#new_run').on('ajax:complete', function(event, data, status, xhr) {
        var date, my_data;
        console.log(data);
        my_data = $.parseJSON(data.responseText);
        date = my_data.run_date;
        $('#create_modal').fadeOut();
        $('#fade').fadeOut();
        return $('#run_table_body').append('<tr>' + '<td class="stat_data run_cell">' + date + '</td>' + '</tr>');
      });
    });
    return $(document).on("submit", ".edit_run", function(e) {
      return $('.edit_run').on('ajax:complete', function(event, data, status, xhr) {
        var element_id, element_id_1, element_id_2, element_id_3, my_data, run_date, run_date_string, run_distance, run_distance_string, run_time, run_time_string;
        my_data = $.parseJSON(data.responseText);
        run_date = my_data.run_date;
        run_time = my_data.run_time.toString();
        run_distance = my_data.run_distance;
        element_id = 'tr#' + my_data.id.toString();
        element_id_1 = element_id + " td:nth_child=(1)";
        alert(element_id_1);
        element_id_2 = element_id + ":nth_child(1)";
        element_id_3 = element_id + ":nth_child(1)";
        run_date_string = '<td class="stat_data run_cell">' + run_date + '</td>';
        run_time_string = '<td class="stat_data run_cell">' + run_time + '</td>';
        run_distance_string = '<td class="stat_data run_cell">' + run_distance + '</td>';
        $('#edit_modal').fadeOut();
        $('#fade').fadeOut();
        return $(element_id_1).text(run_date_string);
      });
    });
  });

}).call(this);
