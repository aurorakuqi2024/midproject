FROM alpine:latest

# Kopjojmë skedarin e skriptit të migrimit në imazhin Docker
COPY mirror-repo.sh /mirror-repo.sh

# E bëjmë skedarin të ekzekutueshëm
RUN chmod +x /mirror-repo.sh

# Specifikojmë skriptin si komandë kryesore kur container-i fillon

ENTRYPOINT [&quot;/mirror-repo.sh&quot;]