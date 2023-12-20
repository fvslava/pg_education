Готовим стэнд\
sudo apt-get update\
sudo apt-get -y install postgresql\
pg_lsclusters\
sudo apt-get install postgresql-contrib\

1.Тест дэфолтных настроек\
sudo -u postgres psql\
создаём базу example\
ставим пароль на уз postgres и запускаем под ним (с учётом рекоммендации пгпро)\
![2](https://github.com/fvslava/pg_education/assets/50954994/1fbdf2aa-9a67-4afe-a5f8-c2e4dd65e06f)\
pgbench -i example\
pgbench -c 50 -j 2 -t 3000 -r example\
![3](https://github.com/fvslava/pg_education/assets/50954994/1a619c55-123b-4305-a2a1-6552fc0aeeaa)\

2. Тюним конфиг с помощью онлайн помошника. Не особо\
![41](https://github.com/fvslava/pg_education/assets/50954994/8ebca045-2450-4330-9102-b4ee339d338e)\
![4](https://github.com/fvslava/pg_education/assets/50954994/eb89095f-6819-4351-99cc-3582f52d309a)\

3. Используем опасные настройки. Да, хорошо.\
ALTER SYSTEM SET fsync=off;\
ALTER SYSTEM SET full_page_writes=off;\
ALTER SYSTEM SET synchronous_commit=off;\
![6](https://github.com/fvslava/pg_education/assets/50954994/151f2305-a609-4496-a378-c00b1af2a1ce)\

4. И под конец выключаем автомвакуум. Выигрыша нет.\
ALTER SYSTEM SET autovacuum=off;\
![7](https://github.com/fvslava/pg_education/assets/50954994/fa698e22-6c45-4edb-8919-14b5ef505c96)\
