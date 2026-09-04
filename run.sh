#!/bin/bash

echo "Gerando Diagramas... ⌛"

curl -s -X POST "https://kroki.io/mermaid/png" \
-H "Content-Type: text/plain" \
--data-binary @uso.mmd \
-o uso.png

curl -s -X POST "https://kroki.io/mermaid/png" \
-H "Content-Type: text/plain" \
--data-binary @atividades.mmd \
-o atividades.png

echo "Diagramas Gerados com Sucesso! ✔️"

ls -lh uso.png atividades.png