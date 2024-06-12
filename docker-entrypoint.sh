#!/bin/bash


database=/var/quickies/quickies.db

if [ ! -f "${database}" ]; then

touch "$database"
chmod 777 -R /var/quickies/

php -r '
try {
  $pdo = new PDO("sqlite:/var/quickies/quickies.db");
  $pdo->setAttribute(PDO::ATTR_ERRMODE, PDO::ERRMODE_EXCEPTION);
  $pdo->setAttribute(PDO::ATTR_EMULATE_PREPARES, 0);
} catch (PDOException $e) {
  echo "Errore di connessione al database: " . $e->getMessage();
  exit();
}

$pdo->exec(file_get_contents("/var/www/html/src/quickies.sql"));

// Esecuzione della query SELECT
$query = "SELECT * FROM q_note";
$statement = $pdo->prepare($query);
$statement->execute();

// Ciclo sui risultati della query
while ($row = $statement->fetch(PDO::FETCH_ASSOC)) {
  // Stampa di ogni riga del risultato
  foreach ($row as $key => $value) {
    echo "$key: $value\n";
  }
  echo "\n";
}

echo "ciao\n";

'

fi

echo "[quickies] Run main process..."
docker-php-entrypoint "$@"
