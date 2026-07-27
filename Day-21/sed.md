#!/bin/bash

<<note

sed 's/nginx/apache/g' file



sed     's/nginx/apache/g'    file
 |              |              |
 |              |              └── File name
 |              └──────────────── Search & Replace rule
 └─────────────────────────────── Stream Editor




=========  s/nginx/apache/g ===  ka matlab


s      = substitute (replace)
nginx  = jo text dhundhna hai
apache = jis text se replace karna hai
g      = global (line me jitni baar mile sab replace karo)



## Example
File (webserver.txt)

nginx is running
nginx is fast
I like nginx

## commandsed 

sed 's/nginx/apache/g' webserver.txt

## Output:

apache is running
apache is fast
I like apache

## Note: This does not permanently change the file. It only displays the modified output on the terminal.

## Permanent Change

If you want to modify the file permanently:

## command
cat webserver.txt

apache is running
apache is fast
I like apache

## Change Port Number

#File:
server_port=8080

##command

sed 's/8080/80/g' config.txt

## output:

server_port=80


##Replace IP Address

DB_HOST=10.0.0.1

## command 
sed 's/10.0.0.1/192.168.1.10/g' app.env

#output 
DB_HOST=192.168.1.10



##Why g?

#Suppose:

nginx nginx nginx


Without g

sed 's/nginx/apache/' file

#output

apache nginx nginx



##With g
sed 's/nginx/apache/g' file

#output

apache apache apache



Why it Matters in DevOps?

DevOps me tumhe hundreds of servers aur config files manage karni padti hain.

1. Update Configuration Files

sed -i 's/DEBUG=true/DEBUG=false/g' .env

Production me debug mode off karne ke liye.


2. Change Docker Image Version

sed -i 's/app:v1/app:v2/g' docker-compose.yml


Before:

image: app:v1

After:

image: app:v2


3. Change Kubernetes Namespace

sed -i 's/dev/prod/g' deployment.yaml

4. Update Nginx Config

sed -i 's/8080/80/g' nginx.conf

5. CI/CD Pipelines

Jenkins/GitHub Actions me:

VERSION=2.0

sed -i "s/VERSION=.*/VERSION=$VERSION/" app.env

Ye automatically version update kar dega.




#!/bin/bash

ENV=$1

if [ "$ENV" = "prod" ]
then
    sed -i 's/DEBUG=true/DEBUG=false/g' .env
fi


Output:

DEBUG=false

Summary
Part	Meaning
sed	Stream Editor
s	Substitute
nginx	Search text
apache	Replace text
g	Replace all occurrences
-i	Modify file permanently


Golden Rule
sed 's/old/new/g' file

Means:
"File me old text ko dhundo aur uski saari occurrences ko new se replace kar do."

Isi liye sed DevOps engineers ka favorite tool hai—kyunki configuration files, YAML files, .env files, Docker Compose, Kubernetes manifests, aur CI/CD pipelines me text replacement bahut frequently hota hai.
note




