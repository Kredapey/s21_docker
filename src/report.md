# Simple Docker

## Оглавление:

1. [Готовый докер](#part-1-готовый-докер)
2. [Операции с контейнером](#part-2-операции-с-контейнером)
3. [Мини веб-сервер](#part-3-мини-веб-сервер)
4. [Свой докер](#part-4-свой-докер)
5. [Dockle](#part-5-dockle)
6. [Базовый Docker Compose](#part-6-базовый-docker-compose)

## Part 1. Готовый докер.

- Взять официальный докер образ с nginx и выкачать его при помощи docker pull

![Part1_1](./screenshots/Part1_1.png)

- Проверить наличие докер образа через docker images

![Part1_2](./screenshots/Part1_2.png)

- Запустить докер образ через docker run -d [image_id|repository]

![Part1_3](./screenshots/Part1_3.png)

- Проверить, что образ запустился через docker ps

![Part1_4](./screenshots/Part1_4.png)

- Посмотреть информацию о контейнере через docker inspect [container_id|container_name]

![Part1_8](./screenshots/Part1_1.png)

- По выводу команды определить и поместить в отчёт размер контейнера, список замапленных портов и ip контейнера

![Part1_5](./screenshots/Part1_5.png)

![Part1_6](./screenshots/Part1_6.png)

![Part1_7](./screenshots/Part1_7.png)

- Остановить докер образ через docker stop [container_id|container_name]

![Part1_9](./screenshots/Part1_9.png)

- Проверить, что образ остановился через docker ps

![Part1_10](./screenshots/Part1_10.png)

- Запустить докер с портами 80 и 443 в контейнере, замапленными на такие же порты на локальной машине, через команду run

![Part1_11](./screenshots/Part1_11.png)

- Проверить, что в браузере по адресу localhost:80 доступна стартовая страница nginx

![Part1_13](./screenshots/Part1_13.png)

- Перезапустить докер контейнер через docker restart [container_id|container_name]

- Проверить любым способом, что контейнер запустился

![Part1_14](./screenshots/Part1_14.png)

## Part 2. Операции с контейнером.

- Прочитать конфигурационный файл nginx.conf внутри докер контейнера через команду exec

![Part2_2](./screenshots/Part2_2.png)

- Создать на локальной машине файл nginx.conf

- Настроить в нем по пути /status отдачу страницы статуса сервера nginx

![Part2_3](./screenshots/Part2_3.png)

- Скопировать созданный файл nginx.conf внутрь докер образа через команду docker cp

- Перезапустить nginx внутри докер образа через команду exec

![Part2_4](./screenshots/Part2_4.png)

- Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![Part2_5](./screenshots/Part2_5.png)

- Экспортировать контейнер в файл container.tar через команду export

![Part2_6](./screenshots/Part2_6.png)

- Остановить контейнер

![Part2_7](./screenshots/Part2_7.png)

- Удалить образ через docker rmi [image_id|repository], не удаляя перед этим контейнеры

![Part2_8](./screenshots/Part2_8.png)

- Удалить остановленный контейнер

![Part2_9](./screenshots/Part2_9.png)

- Импортировать контейнер обратно через команду import

![Part2_10](./screenshots/Part2_10.png)

- Запустить импортированный контейнер

![Part2_11](./screenshots/Part2_11.png)

![Part2_12](./screenshots/Part2_12.png)

- Проверить, что по адресу localhost:80/status отдается страничка со статусом сервера nginx

![Part2_13](./screenshots/Part2_13.png)

## Part 3. Мини веб-сервер.

- Написать мини сервер на C и FastCgi, который будет возвращать простейшую страничку с надписью Hello World!

![Part3_1](./screenshots/Part3_1.png)

- Запустить написанный мини сервер через spawn-fcgi на порту 8080

![Part3_2](./screenshots/Part3_2.png)

![Part3_3](./screenshots/Part3_3.png)

![Part3_4](./screenshots/Part3_4.png)

![Part3_5](./screenshots/Part3_5.png)

![Part3_6](./screenshots/Part3_6.png)

- Написать свой nginx.conf, который будет проксировать все запросы с 81 порта на 127.0.0.1:8080

![Part3_10](./screenshots/Part3_10.png)

- Проверить, что в браузере по localhost:81 отдается написанная вами страничка

![Part3_9](./screenshots/Part3_9.png)

- Положить файл nginx.conf по пути ./nginx/nginx.conf (это понадобится позже)

## Part 4. Свой докер.

- Написать свой докер образ, который:

    1. собирает исходники мини сервера на FastCgi из Части 3

    2. запускает его на 8080 порту

    3. копирует внутрь образа написанный ./nginx/nginx.conf

    4. запускает nginx

![Part4_1](./screenshots/Part4_1.png)

![Part4_2](./screenshots/Part4_2.png)

- Собрать написанный докер образ через docker build при этом указав имя и тег

- Проверить через docker images, что все собралось корректно

![Part4_3](./screenshots/Part4_3.png)

- Запустить собранный докер образ с маппингом 81 порта на 80 на локальной машине и маппингом папки ./nginx внутрь контейнера по адресу, где лежат конфигурационные файлы nginx'а (см. Часть 2)

![Part4_4](./screenshots/Part4_4.png)

- Проверить, что по localhost:80 доступна страничка написанного мини сервера

![Part4_5](./screenshots/Part4_5.png)

- Дописать в ./nginx/nginx.conf проксирование странички /status, по которой надо отдавать статус сервера nginx

![Part4_6](./screenshots/Part4_6.png)

- Перезапустить докер образ

![Part4_7](./screenshots/Part4_7.png)

- Проверить, что теперь по localhost:80/status отдается страничка со статусом nginx

![Part4_8](./screenshots/Part4_8.png)

## Part 5. Dockle.

- Просканировать образ из предыдущего задания через dockle [image_id|repository]

![Part5_1](./screenshots/Part5_1.png)

![Part5_2](./screenshots/Part5_2.png)

- Исправить образ так, чтобы при проверке через dockle не было ошибок и предупреждений

![Part5_4](./screenshots/Part5_4.png)

![Part5_6](./screenshots/Part5_6.png)

![Part5_3](./screenshots/Part5_3.png)

![Part5_5](./screenshots/Part5_5.png)

## Part 6. Базовый Docker Compose.

- Написать файл docker-compose.yml, с помощью которого:

    1. Поднять докер контейнер из Части 5 (он должен работать в локальной сети, т.е. не нужно использовать инструкцию EXPOSE и мапить порты на локальную машину)

    2. Поднять докер контейнер с nginx, который будет проксировать все запросы с 8080 порта на 81 порт первого контейнера

- Замапить 8080 порт второго контейнера на 80 порт локальной машины

![Part6_1](./screenshots/Part6_1.png)

- Остановить все запущенные контейнеры

- Собрать и запустить проект с помощью команд docker-compose build и docker-compose up

- Проверить, что в браузере по localhost:80 отдается написанная вами страничка, как и ранее

![Part6_2](./screenshots/Part6_2.png)

![Part6_3](./screenshots/Part6_3.png)

