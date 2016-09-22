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
      console.log(response);
      var voteNumber = response.points;
      $('.'+response.votable_type+'-points')
    });
  });
});
