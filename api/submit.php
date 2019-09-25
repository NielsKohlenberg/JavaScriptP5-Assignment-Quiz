<?php

//


if (!isset($_GET['answer'], $_GET['code'])) {
  http_response_code(400);
  echo json_encode(array('status_code' => 400, 'message' => 'Answer and code must be specified.'));
  return;
}

include_once('db.php');

$get_responder = $db->prepare('SELECT * FROM responders WHERE code = :code');
$get_responder->bindParam(':code', $_GET['code']);
$get_responder->execute();
$get_responder->setFetchMode(PDO::FETCH_ASSOC);
$responder = $get_responder->fetchAll()[0];

if ($responder) {
  $get_answer = $db->prepare('SELECT * FROM answers WHERE id = :id');
  $get_answer->bindParam(':id', $_GET['answer']);
  $get_answer->execute();
  $get_answer->setFetchMode(PDO::FETCH_ASSOC);
  $answer = $get_answer->fetchAll()[0];

  if ($answer) {
    $check = $db->prepare('SELECT * FROM responses WHERE responder_id = :responder AND answer_id = :answer');
    $check->bindParam(':responder', $responder['id']);
    $check->bindParam(':answer', $answer['id']);
    $check->execute();
    $check_result = $check->fetchAll();

    if (!$check_result) {
      $insert = $db->prepare('INSERT INTO responses (responder_id, answer_id, correct) VALUES (:responder, :answer, :correct)');
      $insert->bindParam(':responder', $responder['id']);
      $insert->bindParam(':answer', $answer['id']);
      $insert->bindParam(':correct', $answer['correct']);
      $insert->execute();
    } else {
      $answer['correct'] = 0;
    }

    echo json_encode(array('message' => 'Answer submitted.', 'correct' => intval($answer['correct'])));
  } else {
    http_response_code(404);
    echo json_encode(array('status_code' => 404, 'message' => 'Answer not found.'));
  }
} else {
  http_response_code(401);
  echo json_encode(array('status_code' => 401, 'message' => 'Unauthorized. Please provide a valid code.'));
}
