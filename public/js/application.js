$(document).ready(function() {
  $('.vote').on('submit', function(event){
    var $voteForm = $(this)
    event.preventDefault();

    var $ajaxRequest = $.ajax({
      method: $voteForm.attr('method'),
      url: $voteForm.attr('action'),
      data: $voteForm.serialize()
    });

    $ajaxRequest.done(function(response){
      var voteNumber = response.points;
      var id = response.votable_id;
      var type = response.votable_type;
      $('.'+type+'-points#'+id).text(voteNumber+ ' votes');
    });
  });
});
