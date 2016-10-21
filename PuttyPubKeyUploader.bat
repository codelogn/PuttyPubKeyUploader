@ECHO OFF

set NLM=^


set NL=^^^%NLM%%NLM%^%NLM%%NLM%


set /p a="Enter Public File Name: "
set /p serverAddress="Enter Server Address: "

set /p username="Enter Username: "

pscp -scp %a% "%username%@%serverAddress%:~/temp.pub"

plink %username%@%serverAddress% -t "mkdir -p .ssh;cd ~/.ssh; chmod 700 ~/.ssh; ssh-keygen -i -f ../temp.pub > temp_os.pub;  cat temp_os.pub >> authorized_keys; chmod 600 ~/.ssh/authorized_keys;chown %username% authorized_keys; rm ~/temp.pub; rm temp_os.pub; exit;"
