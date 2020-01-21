#!/bin/sh

if [ $# -lt 1 ]; then
    printf "Usage: 'mkproj [PROJECT NAME]'\n"
    exit
fi

PROJNAME=$1

if [ -d "$PROJNAME" ]; then
    printf "Directory '$PROJNAME' already exists!\n"
    exit
fi

mkdir "$PROJNAME"
cd "$PROJNAME"
git init -q

touch README.md LICENSE
echo "Go to http://choosealicense.com/ for help choosing a license." > README.md

touch requirements.txt
echo "Flask\nflask-sqlalchemy\npsycopg2\ngunicorn" > requirements.txt

touch Procfile
echo "gunicorn: web app:app" > Procfile

touch env.py app.py
touch .env .gitignore
echo ".env\nenv.py" > .gitignore

printf "Flask project '$PROJNAME' created.\n"
