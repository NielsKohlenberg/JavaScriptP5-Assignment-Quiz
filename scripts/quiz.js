let question = 1;
let score = 0;

let lb_page = 0;
let lb_more_pages = true;

String.prototype.safe = function() {
  return this.replace(/</g, "&lt;").replace(/>/g, "&gt;");
}

let setScore = (s) => {
  score = s;
  $(document).find('#score').html(s);
}

let setQuestion = (q) => {
  question = q;
  localStorage.setItem('last_question', q);
  $(document).find('#question_count').html(q);
  $(document).find('#question_count_text').html(q);
  loadQuestion(q);
}

let loadQuestion = (q) => {
  setLoading(true);
  $.get(BASE_URL + "/getquestion.php?question=" + q, function(data) {
    var json = JSON.parse(data);
    $('.question_text').html(json[0].question);
    $('#answer-text-1').html(json[0].answer).parent().attr('data-api-id', json[0].id);
    $('#answer-text-2').html(json[1].answer).parent().attr('data-api-id', json[1].id);
    $('#answer-text-3').html(json[2].answer).parent().attr('data-api-id', json[2].id);
    $('#answer-text-4').html(json[3].answer).parent().attr('data-api-id', json[3].id);
    setLoading(false);
  });
}

let loadLeaderboard = () => {
  $('#content').load('leaderboard.html', function() {

    if (localStorage.getItem('last_question') !== 'done') {
      $(document).find('.restart').html('Go back');
      $(document).find('#result_score_text').html('');
    }

    if (localStorage.getItem('last_question') === 'done') {
      $.get(BASE_URL + '/getresult.php?code=' + localStorage.getItem('code'), function(data) {
        var json = JSON.parse(data);
        $('#result_score').html(json.correct_answers * 10);
      });
    }
    $.get(BASE_URL + '/leaderboard.php?page=0', function(data) {
      var json = JSON.parse(data);

      json.forEach(function(user) {
        $('.wrapper-users').append('<div class="user"><div class="name"><p>' + user.username.safe() + '</p></div><div class="score"><p>Score: <span>' + user.correct * 10 + '</span></p></div></div>');
      });

      lb_page++

      if (json.length < 50) {
        $('.load-more').css('display', 'none');
        lb_more_pages = false;
      }
    });

    setLoading(false);
  });
}

$(document).on('click', '.load-more', function() {
  $.get(BASE_URL + '/leaderboard.php?page=' + lb_page, function(data) {
    var json = JSON.parse(data);

    json.forEach(function(user) {
      $('.wrapper-users').append('<div class="user"><div class="name"><p>' + user.username.safe() + '</p></div><div class="score"><p>Score: <span>' + user.correct * 10 + '</span></p></div></div>');
    });

    lb_page++

    if (json.length < 50) {
      $('.load-more').css('display', 'none');
      lb_more_pages = false;
    }
  });
});

$(document).on('click', '.restart', function() {
  localStorage.removeItem('code');
  localStorage.removeItem('last_question');
  $('#content').load('landing.html');
});

if (localStorage.getItem('last_question') || localStorage.getItem('page')) {
  setLoading(true);
  if (localStorage.getItem('last_question') === 'done' || localStorage.getItem('page') === 'leaderboard') {
    loadLeaderboard();
  } else {
  $('#content').load('quiz.html', function() {
    setQuestion(parseInt(localStorage.getItem('last_question')));

    $.get(BASE_URL + '/getresult.php?code=' + localStorage.getItem('code'), function(data) {
      var json = JSON.parse(data);
      setScore(json.correct_answers * 10);
    });

  });
}
}

$(document).on('click', '#show-lb', (e) => {
  localStorage.setItem('page', 'leaderboard');
  loadLeaderboard();
});

$(document).on('click', '#answer-1, #answer-2, #answer-3, #answer-4', (e) => {
  setLoading(true);
  var apiID = e.target.attributes['data-api-id'] ? e.target.attributes['data-api-id'].value : e.target.parentElement.attributes['data-api-id'].value;
  $.get(BASE_URL + "/submit.php?code=" + localStorage.getItem('code') + '&answer=' + apiID, function(data) {
    var json = JSON.parse(data);
    if (json.message !== "Answer submitted.") return;
    if (json.correct === 1) setScore(score + 10);
    if (question === 10) {
      localStorage.setItem('last_question', 'done');
      loadLeaderboard();
    } else {
      setQuestion(question + 1);
    }
  });
});
