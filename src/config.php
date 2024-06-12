<?php

$title_faq = "Quickies";
$footer_text = "<a href=\"https://github.com/nst/Quickies\">Quickies</a> - © 2011 seriot.ch - <a href=\"http://seriot.ch/contact.php\">contact</a>";

$srv_host = "localhost";
$srv_user = "quickies_public";
$srv_pass = "";
$srv_db = "quickies";


try {
    $pdo = new PDO("sqlite:/var/quickies/quickies.db");
    $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
    $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, 0);
} catch (PDOException $e) {
    echo "Errore di connessione al database: " . $e->getMessage();
    exit();
}

$GLOBALS["con"] = $pdo;
$PHP_SELF = $_SERVER['PHP_SELF'];
