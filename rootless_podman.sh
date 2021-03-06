#!/usr/bin/env bash 
#Author: 755-linuxpadawan
#Note : Ce script doit etre lancé avec les droits root, il creer le fichier /etc/sysctl.d/userns.conf si non existant
#Les fichiers subgid et subuid seront crees
#l'utilisateur a renseigner au lancement du script est l'utilisateur non root et existant sur le systeme.
# faire un chmod +x nomduscript pour rendre exeecutable le script
#Voir aussi ce tuto auquel je me suis servi pour creer le script: https://critchlow.xyz/2019/09/23/rootless-podman.html

#Ask nom user a add pour subgid et subuid
read -p "Quel est l'user a add dans les fichiers subgid/subuid ?" myUserName

if [ ! -f /etc/sysctl.d/userns.conf ]
then
echo "kernel.unprivileged_userns_clone=1" > /etc/sysctl.d/userns.conf
else
echo "Verifier si kernel.unprivileged_userns_clone=1 dans le fichier [ /etc/sysctl.d/userns.conf ]"
fi

if [ ! -f /etc/subgid ] && [ ! -f /etc/subuid ]
then
    echo "Creation des fichiers subgid et subuid en cours..."
    touch /etc/subgid
    touch /etc/subuid
    echo "Ajout de l'utisateur avec extension de uid/gid en cours..."
    usermod --add-subuids 100000-165535 ${myUserName}
    usermod --add-subgids 100000-165535 ${myUserName}
    echo ""
    cat /etc/sub*
 else
    echo "Ajout de l'uitisateur avec extension de uid/gid en cours..."
    usermod --add-subuids 100000-165535 ${myUserName}
    usermod --add-subgids 100000-165535 ${myUserName}
    echo ""
    cat /etc/sub*
fi
