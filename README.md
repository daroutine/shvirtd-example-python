https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/0.JPG


# Домашнее задание к занятию 5. «Практическое применение Docker»


Задача 0
Убедитесь что у вас НЕ(!) установлен docker-compose, для этого получите следующую ошибку от команды docker-compose --version
Command 'docker-compose' not found, but can be installed with:

sudo snap install docker          # version 24.0.5, or
sudo apt  install docker-compose  # version 1.25.0-1

See 'snap info docker' for additional versions.
В случае наличия установленного в системе docker-compose - удалите его.
2. Убедитесь что у вас УСТАНОВЛЕН docker compose(без тире) версии не менее v2.24.X, для это выполните команду docker compose version

Своё решение к задачам оформите в вашем GitHub репозитории!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!

# Решение 0

![1](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/0.JPG);
![1.1](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/0.1.JPG);

# Задача 1

Сделайте в своем GitHub пространстве fork репозитория.

Создайте файл Dockerfile.python на основе существующего Dockerfile:

Используйте базовый образ python:3.12-slim
Обязательно используйте конструкцию COPY . . в Dockerfile
Создайте .dockerignore файл для исключения ненужных файлов
Используйте CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "5000"] для запуска
Протестируйте корректность сборки
(Необязательная часть, *) Изучите инструкцию в проекте и запустите web-приложение без использования docker, с помощью venv. (Mysql БД можно запустить в docker run).

(Необязательная часть, *) Изучите код приложения и добавьте управление названием таблицы через ENV переменную.

ВНИМАНИЕ!
!!! В процессе последующего выполнения ДЗ НЕ изменяйте содержимое файлов в fork-репозитории! Ваша задача ДОБАВИТЬ 5 файлов: Dockerfile.python, compose.yaml, .gitignore, .dockerignore,bash-скрипт. Если вам понадобилось внести иные изменения в проект - вы что-то делаете неверно!

# Решение 1

![1](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/1.0.JPG);
![1.1](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/1.1.JPG);
![1.2](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/1.2.JPG);
![1.3](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/1.3.JPG);
![1.4](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/1.JPG);

Задача 2 (*)

Задача 3

Изучите файл "proxy.yaml"
Создайте в репозитории с проектом файл compose.yaml. С помощью директивы "include" подключите к нему файл "proxy.yaml".
Опишите в файле compose.yaml следующие сервисы:
web. Образ приложения должен ИЛИ собираться при запуске compose из файла Dockerfile.python ИЛИ скачиваться из yandex cloud container registry(из задание №2 со *). Контейнер должен работать в bridge-сети с названием backend и иметь фиксированный ipv4-адрес 172.20.0.5. Сервис должен всегда перезапускаться в случае ошибок. Передайте необходимые ENV-переменные для подключения к Mysql базе данных по сетевому имени сервиса web

db. image=mysql:8. Контейнер должен работать в bridge-сети с названием backend и иметь фиксированный ipv4-адрес 172.20.0.10. Явно перезапуск сервиса в случае ошибок. Передайте необходимые ENV-переменные для создания: пароля root пользователя, создания базы данных, пользователя и пароля для web-приложения.Обязательно используйте уже существующий .env file для назначения секретных ENV-переменных!

Запустите проект локально с помощью docker compose , добейтесь его стабильной работы: команда curl -L http://127.0.0.1:8090 должна возвращать в качестве ответа время и локальный IP-адрес. Если сервисы не стартуют воспользуйтесь командами: docker ps -a  и docker logs <container_name> . Если вместо IP-адреса вы получаете информационную ошибку --убедитесь, что вы шлете запрос на порт 8090, а не 5000.

Подключитесь к БД mysql с помощью команды docker exec -ti <имя_контейнера> mysql -uroot -p<пароль root-пользователя>(обратите внимание что между ключем -u и логином root нет пробела. это важно!!! тоже самое с паролем) . Введите последовательно команды (не забываем в конце символ ; ): show databases; use <имя вашей базы данных(по-умолчанию example)>; show tables; SELECT * from requests LIMIT 10;.

Остановите проект. В качестве ответа приложите скриншот sql-запроса.

# Решение 3

![3](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/3.JPG);
![3.1](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/3.1.JPG);
![3.2](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/3.2.JPG);
![3.3](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/3.3.JPG);
![3.4](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/3.4.JPG);
![3.5](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/3.5.JPG);
![3.6](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/3.6.JPG);
![3.7](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/3.7.JPG);

# Задача 4
Запустите в Yandex Cloud ВМ (вам хватит 2 Гб Ram).
Подключитесь к Вм по ssh и установите docker.
Напишите bash-скрипт, который скачает ваш fork-репозиторий в каталог /opt и запустит проект целиком.
Зайдите на сайт проверки http подключений, например(или аналогичный): https://check-host.net/check-http и запустите проверку вашего сервиса http://<внешний_IP-адрес_вашей_ВМ>:8090. Таким образом трафик будет направлен в ingress-proxy. Трафик должен пройти через цепочки: Пользователь → Internet → Nginx → HAProxy → FastAPI(запись в БД) → HAProxy → Nginx → Internet → Пользователь
(Необязательная часть) Дополнительно настройте remote ssh context к вашему серверу. Отобразите список контекстов и результат удаленного выполнения docker ps -a
Повторите SQL-запрос на сервере и приложите скриншот и ссылку на fork.

# Решение 4

![4](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/4.1.JPG);
![4.2](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/4.2.JPG);
![4.3](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/4.3.JPG);
![4.4](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/4.4.JPG);
![4.5](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/4.5.JPG);
![4.6](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/4.JPG);
![4.7](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/4.6.JPG);

Задача 5 (*)

# Задача 6
Скачайте docker образ hashicorp/terraform:latest и скопируйте бинарный файл /bin/terraform на свою локальную машину, используя dive и docker save. Предоставьте скриншоты действий .

# Решение

![6](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/6.JPG);
![6.1](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/6.1.JPG);
![6.2](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/6.2.JPG);
![6.3](https://github.com/daroutine/shvirtd-example-python/blob/main/screenshots/6.3.JPG);









