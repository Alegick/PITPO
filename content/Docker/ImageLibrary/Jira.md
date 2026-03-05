## Jira

Выполните все этапы работы с проектом по примеру с [Nginx](/content/Docker/ImageLibrary/Nginx.md)

> Никогда в разработке не используйте русские имена файлов и каталогов!
> Никогда в разработке не используйте пробелы и спец.символы в именах файлов и каталогов!

Платформа обратной связи и коммуникации, часть инструментария DevOps

```shell
docker run -d \
  --name jira \
  -p 8082:8080 \
  atlassian/jira-software:latest
```

не работает!
```shell
docker run -d -it -p 2990:2990 --name jira addono/jira-software-standalone
```
Альтернативный образ
```shell
docker run -d --name jira -p 2990:8082 atlassian/jira-software:latest
```

Запустите лог Jira для наблюдением за процессом подготовки приложения:
```shell
docker logs -f jira
```
В логах должно быть видно, запускается ли Jira. Образ addono/jira-software-standalone при первом запуске долго инициализируется (до 5-10 минут)

По завершению подготовки можно открыть в браузере запущенное приложение Jira:

[Зайти в админ-панель Jira в браузере по адрему http://localhost:8082](http://localhost:8082)

> Заполнять данные админ-панели не нужно!