$(document).ready(function(){
  $('#star').raty({
    readOnly: true,
    score: 5,
    path: '/assets'
  });
  $('#star').on('click', function(score){
    alert('Score'+ score);
  });
});
