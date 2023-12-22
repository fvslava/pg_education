Текст бэкапа не сохранился, но он 1 в 1 как в конспекте. За исключением того, что бэкапим на шару.

Создаём три ВМ. pgsource, pgdest, share. ВМ share неприрываемая. Делаем шару\
https://www.tecmint.com/install-nfs-server-on-ubuntu/
На шаре даём доступ всей сетке\
/mnt/nfs_share  10.128.0.0/24(rw,sync,no_subtree_check)\
и проверяем, что фаервол не включен\
sudo ufw status

Подключаем шару на сорс и дестанейшн\
sudo apt update &&\
sudo apt install nfs-common -y &&\
sudo mkdir /mnt/nfs_clientshare &&\
sudo chmod 777 /mnt/nfs_clientshare &&\
sudo mount 10.128.0.16:/mnt/nfs_share  /mnt/nfs_clientshare

Устанавливаем ПГ\
sudo apt update && sudo DEBIAN_FRONTEND=noninteractive apt upgrade -y -q && sudo sh -c 'echo "deb http://apt.postgresql.org/pub/repos/apt $(lsb_release -cs)-pgdg main" > /etc/apt/sources.list.d/pgdg.list' && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add - && sudo apt-get update && sudo DEBIAN_FRONTEND=noninteractive apt -y install postgresql-15

Устанавливаем Пробэкап\
sudo apt install gpg wget  &&
wget -qO - https://repo.postgrespro.ru/pg_probackup/keys/GPG-KEY-PG-PROBACKUP | \
sudo tee /etc/apt/trusted.gpg.d/pg_probackup.asc &&
. /etc/os-release &&
echo "deb [arch=amd64] https://repo.postgrespro.ru/pg_probackup/deb $VERSION_CODENAME main-$VERSION_CODENAME" | \
sudo tee /etc/apt/sources.list.d/pg_probackup.list &&
sudo apt-get update &&
apt-cache search pg_probackup &&
sudo apt install pg-probackup-15

Задаём переменную\
echo "BACKUP_PATH=/home/slava/">>~/.bashrc &&
echo "export BACKUP_PATH">>~/.bashrc &&
cd $HOME &&
. .bashrc &&
echo $BACKUP_PATH
sudo chmod -R 777 /home/slava

Инициализируем\
pg_probackup-15 init
pg_probackup-15 add-instance --instance 'main' -D /var/lib/postgresql/15/main

Чистим папку с бд, без этого ошибка ( пока не смог починить\
pg_lsclusters \
sudo systemctl stop postgresql \
su postgres \
rm -rf /var/lib/postgresql/15/main \
sudo systemctl start postgresql 

И ресторимся\
pg_probackup-15 restore -B /mnt/nfs_clientshare/ --instance main -i S61ALV -D /var/lib/postgresql/15/main

![2](https://github.com/fvslava/pg_education/assets/50954994/596856b0-715b-468f-bba5-c553bcea7939)
