<?php

//


if (!isset($_GET['username'])) {
  http_response_code(400);
  echo json_encode(array('status_code' => 400, 'message' => 'Username must be specified.'));
  return;
}

include_once('db.php');

$code = substr(md5(uniqid(mt_rand(), true)), 0, 8);

$stmt = $db->prepare('SELECT code FROM responders WHERE code = "' . $code . '"');
$stmt->execute();
$result = $stmt->setFetchMode(PDO::FETCH_ASSOC);

if ($stmt->fetchAll()) {
  $code = substr(md5(uniqid(mt_rand(), true)), 0, 8);
}

$insert = $db->prepare('INSERT INTO responders (code, username) VALUES (:code, :username)');
$insert->bindParam(':code', $code);
$insert->bindParam(':username', $_GET['username']);
$insert->execute();

echo json_encode(array('code' => $code));
