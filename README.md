# Инструкция по установке Nginx App Protect WAF на сервер
Можете запустить файл main.tf для того чтобы создать EC2 на AWS. Необходимо предварительно добавить свой ACCESS_TOKEN и SECRET_TOKEN.

Чтобы установить на сервер Nginx App Protect необходимо:
1. Добавить IP адрес сервера в файл /etc/ansible/hosts
2. Выполнить команду ansible-playbook install.yml

Если хотите установить приложение DVWA c защитой WAF:
 - ansible-playbook install.yml
 - ansible-playbook dvwa.yml

После выполнения этих действий необходимо сделать reboot сервера.
