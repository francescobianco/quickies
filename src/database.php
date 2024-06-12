<?php

function database_query($pdo, $query, $success = null)
{
    return $pdo->query($query);
}

function database_insert_id($pdo)
{
    return $pdo->lastInsertId();
}

function database_fetch_row($result)
{
    return $result->fetch();
}

function database_real_escape_string($pdo, $string)
{
    $quotedString = $pdo->quote($string);

    return substr($quotedString, 1, -1);
}
