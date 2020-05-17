## Тестовое задание DevOps

### Задача

Опишите с помощью terraform и ansible:

- Поднимание виртуалки в любом публичном облаке
- Начальную настройку сервера
- Установку nginx\httpd
- Деплой текстового файла для раздачи через веб-сервер

Сделайте заготовку для деплоя с помощью docker:

Тот же текстовый файл должен упаковываться в образ и раздаваться с помощью веб-сервера.
Выложите код на любой гит-хостинг для проверки.


#### Требования
Указанная версия или выше.
* terraform v0.12.23
* aws-cli/2.0.10
* ansible 2.9.6
* Docker 19.03.8

#### Структура репозитория.
* terraform - код развертывания инстанса и сопутствующих сущностей в aws.
* provisioning - ansible роли первичной конфигурации сервера и развертывания web сервера.
* web - Docker образ.

### Развертывание инстанса
Перейдите в каталог terraform.

Через консоль aws авторизуйтесь в облаке.  
```aws configure```  

Установите провайдер  
```terraform init```

Разверните ВМ в облаке  
```terraform apply -auto-approve```  

Создайте inventory файл.

```terraform output web > ../provisioning/inventory```

_В продуктовом окружении предпочтительнее использовать dynamic inventory.  
Для поставленной задачи считаю возможным обойтись генерацией inventory через terraform output_

### Настройка сервера.

Перейдите в каталог provisioning

Установите зависимости.

```ansible-galaxy install -r requirements.yaml --force-with-deps```  

Выполните playbook

Установка nginx через пакетный менеджер apt
```ansible-playbook -i inventory playbook.yaml```  

Установка в docker

Cоберите docker образ

```
docker build -t docker_login/test-17052020:stable
docker push docker_login/test-17052020:stable
```

В playbook.yaml установите переменные  
apt: false  
docker: true

Запустите

```ansible-playbook -i inventory playbook.yaml```