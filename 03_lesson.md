С вашего позволения, пропущу пару скришотов. \
Разворачиваем ЯК.Устанавливаем докер, ПГ в докере, делаем базу, проверяем что всё работает с помощью этой статьи. \
Также там указан ключ для выноса дата файлов, что даёт нам возможность перезаливать пг в докере без потерь данных. \
https://selectel.ru/blog/postgresql-docker-setup \
Для подключения к ПГ используем ssh тунель, т.к. отрывать 5432 в ЯК и делать сертификат долго. Но я сделаю в будущем) И да, в таком случае для Бивера надо скачать jdbc драйвер и обновить дэфолтные драйвера\
![image](https://github.com/fvslava/pg_education/assets/50954994/b2f5c56d-ef05-40f1-aa91-f6f1e9452a13)\
![image](https://github.com/fvslava/pg_education/assets/50954994/33bf71bb-294c-4eea-90a4-c39bff670e83)\
![image](https://github.com/fvslava/pg_education/assets/50954994/831c936b-aef1-4a9c-8940-b79e62353590)\
Теперь самое важное - клиент в докере. Скачиваем отсюда 
https://hub.docker.com/r/rtdl/psql-client
И запускаем. Жёлтым выделил то, до чего доходил пару часов. Докер сетка.\
![image](https://github.com/fvslava/pg_education/assets/50954994/04664f1c-9faf-4ee0-952a-784614f9552c)\
Успешно\
![image](https://github.com/fvslava/pg_education/assets/50954994/e1c2ab6a-e8f4-4270-bc17-b6700031ab9f)\



