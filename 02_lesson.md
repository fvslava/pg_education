Создаём ВМ через GUI в ЯК\
Ставим PG 15 по этой статье https://www.radishlogic.com/postgresql/how-to-install-postgresql-15-on-ubuntu  
![1](https://github.com/fvslava/pg_education/assets/50954994/815e270b-d2e1-4834-9a62-fc3f91e7c969)\
Создаём БД и таблицу\
![2](https://github.com/fvslava/pg_education/assets/50954994/0aa40e43-d0c4-463b-8c20-ee525219fa35)\
Выключаем кластер\
![3](https://github.com/fvslava/pg_education/assets/50954994/3376d1c9-22c9-45e1-8ac9-41894ab498a4)\
В GUI создаём и аттачим новый диск в той же зоне\
![4](https://github.com/fvslava/pg_education/assets/50954994/cb686d77-a5c5-48c0-802f-15b448c8e7a3)\
![5](https://github.com/fvslava/pg_education/assets/50954994/11280baf-2ca8-4d10-95d7-a92b62d558bc)\
Смотрим диски\
![6](https://github.com/fvslava/pg_education/assets/50954994/bce2378b-5113-4e73-aa69-4f8cf4b04c6f)\
Идём по инструкции из диджитал океана\
![7](https://github.com/fvslava/pg_education/assets/50954994/825a3ee6-17b6-40ea-8c11-8296746d1e9e)\
![8](https://github.com/fvslava/pg_education/assets/50954994/c51b49a0-058f-4dce-83e6-72a5e579b925)\
![9](https://github.com/fvslava/pg_education/assets/50954994/022850f5-dc90-4a7b-81b0-9ead9bf23454)\
ребутаемся, диск на месте\
![10](https://github.com/fvslava/pg_education/assets/50954994/bc6692cd-9304-42c4-ab00-99be939cbf4f)\
меняем путь по умолчанию к data. кластер не стартует. естественно, как он будет стартовать\
![11](https://github.com/fvslava/pg_education/assets/50954994/b474f227-1c3f-40cf-a3da-975d24239817)\
легко находим параметр в postgresql.conf и меняем первую строчку\
![12](https://github.com/fvslava/pg_education/assets/50954994/71dd6a5e-9122-457c-bdcf-5d47ae6b1aa4)\
теперь всё ок\
![14](https://github.com/fvslava/pg_education/assets/50954994/245c3626-ddfe-40ed-a019-92f50075bd68)\
![13](https://github.com/fvslava/pg_education/assets/50954994/93fe2800-e18a-4867-9149-7928cb6ae1be)\
данные на месте\
![15](https://github.com/fvslava/pg_education/assets/50954994/1f04bde6-e186-4bb6-8fa0-0168fffd2b15)\
