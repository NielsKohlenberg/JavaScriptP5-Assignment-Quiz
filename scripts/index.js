const BASE_URL = "http://localhost/jsquiz/api";

$('#content').load('landing.html');

let setLoading = (val) => {
  if (val) $('.loader').css('display', 'flex').hide().fadeIn();
  if (!val) $('.loader').fadeOut();
}

let startQuiz = () => {
  let name = $('#name-box').val();

  $('#name-box').attr('disabled', true);
  setLoading(true);
  $.get(BASE_URL + "/start.php?username=" + name, function(data) {
    const json = JSON.parse(data);
    localStorage.setItem('code', json.code);
    localStorage.setItem('last_question', 1);
    $('#content').load('quiz.html');
    loadQuestion(1);
    setLoading(false);
  });
}

$(document).on('keyup', '#name-box', (e) => {
  if (e.key === "Enter") startQuiz();
});

$(document).on('click', '#submit-button', startQuiz);


$('.logo').click(function() {
  $('.slide').animate({width: 'toggle'}).css('display', 'flex');
});
