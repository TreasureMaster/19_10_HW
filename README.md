# Домашнее задание SF HW-19.10

### Порядок действий

Примерный порядок действий. Названия можно образов\тегов нужно использовать свои.

1. Сборка образа с именем *nginx.test*: `docker build -t nginx.test .`
2. Просмотр списка образов (проверка): `docker images`
3. Тестовый запуск: `docker run --name nginx -d -p 80:80 -v ${PWD}/data:/data:rw nginx.test`
4. Регистрация на Dockerhub
5. Присвоить тег образу: `docker tag nginx3.test  myperfectdockerid/mytestrep:nginx3.test`
6. Вход в dockerhub: `docker login`
7. Отправить образ в dockerhub: `docker push myperfectdockerid/mytestrep:nginx3.test`
8. Теперь проверка:
9. Удалить образ с локальной машины: `docker rmi myperfectdockerid/mytestrep:nginx3.test`
10. Затянуть образ (если надо, то можно войти - `docker login`): `docker pull myperfectdockerid/mytestrep:nginx3.test`
11. Проверка, что затянули образ: `docker images`
12. Запуск: `docker run -d -p 80:80 -v ${PWD}/data:/data:rw myperfectdockerid/mytestrep:nginx3.test`

### Пример от Dockerhub

Вы можете отправить новый образ в этот репозиторий с помощью интерфейса командной строки.

1. `docker tag local-image:tagname new-repo:tagname`
2. `docker push new-repo:tagname`

Обязательно измените имя тега на желаемый тег репозитория образа.

Чтобы отправить новый тег в этот репозиторий:
`docker push michaelshewzov/homework19:tagname`