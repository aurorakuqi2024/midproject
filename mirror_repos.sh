#!/bin/bash

# Kontrollojmë nëse janë dhënë argumentet e nevojshme
if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <https://bitbucket.org/aurora-bitbucket/hello-bitbucket/src/main/> <https://github.com/aurorakuqi2024/midproject>"
  exit 1
fi

SOURCE_REPO=$1
DESTINATION_REPO=$2

echo "Source Repository: $SOURCE_REPO"
echo "Destination Repository: $DESTINATION_REPO"

# Fshijmë `repo_temp` nëse ekziston nga një ekzekutim i mëparshëm
if [ -d "repo_temp" ]; then
  echo "Removing existing repo_temp directory..."
  rm -rf repo_temp
fi  # Sigurohemi që `if` është mbyllur

# Klonimi i repository-it burimor
git clone --mirror "$SOURCE_REPO" repo_temp || { echo "Error cloning source repo"; exit 1; }

# Kontrollojmë nëse direktoria repo_temp është krijuar me sukses
if [ ! -d "repo_temp" ]; then
  echo "Error: Directory 'repo_temp' was not created"
  exit 1
fi

# Lëvizim në direktorinë e klonuar
cd repo_temp || exit 1

# Ndryshojmë URL-n e remote-it për të treguar drejt repository-it të ri
git remote set-url origin "$DESTINATION_REPO"

# Shtyjmë të gjitha degët dhe tag-et në repository-n e ri
git push --mirror || { echo "Error pushing to destination repo"; exit 1; }

# Pastrimi i direktorisë së përkohshme
cd ..
rm -rf repo_temp

echo "Repository u migrua me sukses nga $SOURCE_REPO në $DESTINATION_REPO!"
Collapse









