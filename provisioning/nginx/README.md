Nginx
=========

Роль запуска nginx в

Role Variables
--------------

image - образ с nginx  
apt - флаг установки nginx через пакетный менеджер  
docker - флаг деплоя в контейнере

Dependencies
------------

geerlingguy.docker

Example Playbook
----------------

    - hosts: web
      roles:
         - nginx

License
-------

BSD

