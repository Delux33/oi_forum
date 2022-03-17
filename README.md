# Мини форум с ботом для ответа на комментарии

***Задача проекта - получить опыт работы с Linux и написания простых bash скриптов, также углубить знания в Spring, Freemarker, Boostrap, Hibernate, Maven***
____
Сам форум состоит из тем, заголовок для статей, самих статей и комментарий для статей.

Темы может создавать админ и модератор, удалять темы может только админ.
Заголовки статей могут создавать админ, модератор и юзер, удалять заголовки статей (соответственно сразу саму статью и комментарии) могут админ и модератор.
Админ также может удалять комментарии

Задача бота — если кто-то оставляет комментарии под статьей, то бот должен ответить на этот комментарий
прочитать книгу или файл который мы ему укажем и с помощью регулярного выражения заполнить базу данных фразами.
После этого бот случайным образом выбирает фразу и отвечает на все оставшиеся без ответа комментарии на форуме. Главное условие для бота, что ему нельзя использовать фразу больше одного раза (то есть если в базе 100 фраз, то и ответов будет 100), а если бот уже использовал все фразы, он отвечает: "Не знаю, что тебе ответить".

С какой периодичностью бот будет проверять форум на наличие не отвеченных комментариев настраивается с помощью Scheduled Spring. Периодичность обновление базы данных с фразами также настраивается с помощью cron-демона в Linux.

Сам форум и бот запускаются на Linux, с помощью скрипта запускается форум и запрашивается логин и пароль для добавления в базу данных админа:

![image](https://user-images.githubusercontent.com/92450565/158563307-dae07600-d3c7-4ed4-806e-61e3265958b7.png)

Админ успешно добавлен:

![image](https://user-images.githubusercontent.com/92450565/158566051-c31e1f5a-cb0e-4682-8b30-33747680b8a7.png)

Далее заходим на форум и авторизуемся как admin и пишем первую тему

![image](https://user-images.githubusercontent.com/92450565/158567187-230c637f-4804-48cb-b543-fae60ddbb57a.png)

Так же в этой теме создаем заголовок своей статьи

![image](https://user-images.githubusercontent.com/92450565/158567378-381d862e-48cd-4008-9ccf-6c2f33818040.png)

Далее пишем саму статью и пытаемся добавить пустой комментарий

![image](https://user-images.githubusercontent.com/92450565/158567590-3644925a-25d6-4153-8ece-f86a93556c1b.png)

Для демонстрации работы бота, добавим пару комментариев

![image](https://user-images.githubusercontent.com/92450565/158568011-98740719-64cd-41d7-a8a8-9debabda9882.png)

Через 30 секунд бот ответил на мои комментарии (это время я сам указал в Scheduled Spring), используя фразы из базы данных которые туда положил скрипт (для демонстрации, положил файл в котором под регулярное выражение подходило только 1 предложение), а когда закончились фразы из базы данных, то он ответил стандартным сообщением

![image](https://user-images.githubusercontent.com/92450565/158570025-10930f21-190f-4fcd-9d43-abde76e37bf7.png)
