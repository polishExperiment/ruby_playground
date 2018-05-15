Stop all docker containers:  
`$ docker stop $(docker container ls --format {{.ID}} | tr '\n' ' ')`
