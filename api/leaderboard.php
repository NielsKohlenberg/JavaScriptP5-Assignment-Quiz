<?php

include_once('db.php');

$page = isset($_GET['page']) ? intval($_GET['page']) : 0;
$max_results_per_page = 50;

$last_result = $page * $max_results_per_page + $max_results_per_page;
$first_result = $page * $max_results_per_page;

$select = $db->prepare('SELECT responder_id, responders.username, COUNT(*) AS correct FROM responses INNER JOIN responders ON responders.id = responses.responder_id WHERE correct = 1 GROUP BY responder_id  ORDER BY correct DESC LIMIT :limitt OFFSET :offsett');
$select->bindParam(':limitt', $last_result, PDO::PARAM_INT);
$select->bindParam(':offsett', $first_result, PDO::PARAM_INT);
$select->execute();
$select->setFetchMode(PDO::FETCH_ASSOC);

echo json_encode($select->fetchAll());
