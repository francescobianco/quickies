#!/bin/bash


echo "[webrequest] Run main process..."
docker-php-entrypoint "$@"
