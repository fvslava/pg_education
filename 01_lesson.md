Создаём ключи на Win по инструкции ЯК\
![1](https://github.com/fvslava/pg_education/assets/50954994/9b893bc1-7805-4b3b-b701-0421f064735b) \
Создаём ВМ-терминалку в ЯК, прописываем статический ip (на скриншотах разные ip,тк настройка ставилась после нескольких ребутов ВМ)\
![2](https://github.com/fvslava/pg_education/assets/50954994/0ba7a02b-37ba-410f-b843-40ee419053e4)\
![6](https://github.com/fvslava/pg_education/assets/50954994/8260fc71-a05b-4ffe-8228-2c008a1aaee6)\
Устанавливаем Yandex CLI\
![3](https://github.com/fvslava/pg_education/assets/50954994/4f0b3cba-2e53-4751-a021-963ace076dba)\
Создаём через графический интерфейс ВМ pgtest\
Заходим на pgtest, разрешаем доступ с терминалки\
Все эти манипуляции нужны, т.к. пока не получилось создавть ВМ с нужными параметрами через терминалку в cli. Чуть позже разберусь.\
![7](https://github.com/fvslava/pg_education/assets/50954994/90f26e00-1b2e-4f06-bffd-577467fce62e)\
Ставим Пг, по умолчанию 14 версия\
![image](https://github.com/fvslava/pg_education/assets/50954994/85ead3c7-4559-497c-8a24-07b41fcc26d1)\
Проверяем кластер\
![8](https://github.com/fvslava/pg_education/assets/50954994/4fe3ccd9-d284-42ff-86d3-ae43b4ccf9e7)\
Создаём базу, таблицу. Отключаем автокоммит. Запускаем первый тест\
![10](https://github.com/fvslava/pg_education/assets/50954994/24cc5611-2c6a-4ab6-a583-a917df8b47f4)\
Уровень изоляции read commited не допускает грязное чтение. После коммита всё ок.\
![13](https://github.com/fvslava/pg_education/assets/50954994/358c98d8-9634-4efb-a8e4-de8d531ead51)\
Запускаем второй тест\
![14](https://github.com/fvslava/pg_education/assets/50954994/172b711a-981a-4870-90ea-b3a7e5848db8)\
Тоже самое. repetable read не допускает грязное чтение.\
![image](https://github.com/fvslava/pg_education/assets/50954994/5bf32992-df28-4487-8bbe-1cd36a061782)\
