#!/bin/sh
cat << EOT
Content-Type: application/json

{
  "host": "${SERVER_NAME}",
  "port": "1213"
}
EOT
