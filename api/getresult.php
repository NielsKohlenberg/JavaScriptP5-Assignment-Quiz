<?php

//


if (!isset($_GET['code'])) {
  http_response_code(401);
  echo json_encode(array('status_code' => 401, 'message' => 'Unauthorized. Please provide a valid code.'));
  return;
}

include_once('db.php');

$select_1 = $db->prepare('SELECT * FROM responders WHERE code = :code');
$select_1->bindParam(':code', $_GET['code']);
$select_1->execute();
$result = $select_1->setFetchMode(PDO::FETCH_ASSOC);
$responder = $select_1->fetchAll()[0];

$correct_i = $db->prepare('SELECT COUNT(*) FROM responses WHERE responder_id = :id AND correct = 1');
$correct_i->bindParam(':id', $responder['id']);
$correct_i->execute();
$result_2 = $select_1->setFetchMode(PDO::FETCH_ASSOC);
$correct = $correct_i->fetchAll()[0];

echo json_encode(array('correct_answers' => $correct['COUNT(*)']));
