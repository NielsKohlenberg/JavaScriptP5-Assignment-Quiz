<?php

//


if (!isset($_GET['question'])) {
  http_response_code(400);
  echo json_encode(array('status_code' => 400, 'message' => 'Question must be specified.'));
  return;
}

include_once('db.php');

$select = $db->prepare('SELECT answers.id, answers.question_id, answers.answer, questions.question FROM answers INNER JOIN questions ON answers.question_id = questions.id WHERE answers.question_id = :id');
$select->bindParam(':id', $_GET['question']);
$select->execute();
$result = $select->setFetchMode(PDO::FETCH_ASSOC);

echo json_encode($select->fetchAll());
