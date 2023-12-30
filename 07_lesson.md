ЯК или другая вертуализация не подходят. Поэтому разворачивал на домашнем компе на винде.\
Устанавливаем мииникуб
https://selectel.ru/blog/tutorials/how-to-run-kubernetes-with-minikube/  
Устанавливаем кубер 
https://www.shellhacks.com/install-minikube-on-windows/  
Устанавливаем helm 
https://helm.sh/docs/intro/install/  
Стартуем миникуб, инсталлим пг с паролем, проверяем что пг доступен  
![1](https://github.com/fvslava/pg_education/assets/50954994/2287e211-bba8-49b3-9ec4-ef2e07a829a2)
Пробрасываем порт для пода, заходим через дбивер  
kubectl port-forward pg-minikube-postgresql-0 5432:5432  
![image](https://github.com/fvslava/pg_education/assets/50954994/5b8e285b-6353-4854-aeab-08c911b6e152)

