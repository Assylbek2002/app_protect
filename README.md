# Инструкция по установке Nginx App Protect WAF на сервер
Чтобы установить на сервер Nginx App Protect необходимо:
1. Добавить IP адрес сервера в файл /etc/ansible/hosts
2. Выполнить команду ansible-playbook install.yml

Если хотите установить приложение DVWA c защитой WAF:
 - ansible-playbook install.yml
 - ansible-playbook dvwa.yml
После выполнения этих действий необходимо сделать reboot сервера.
