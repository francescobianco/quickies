<?php


function database_query($pdo, $query, $success)
{
    $result = $pdo->query($query);

    return $result;
}

function database_insert_id($pdo)
{
    return $pdo->lastInsertId();
}

function mysqli_fetch_row($result)
{
    return $result->fetch();
}
