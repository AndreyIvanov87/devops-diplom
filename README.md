# devops-diplom
diplom


Есть несколько способов не светить чувстительные данные в репозитории: key.json , export variable. Дл я работы выбран способ с вынесением данных в отдельный файл terraform.tfvars вне репозитория. 
В репозитории есть файл terraform.tfvars-template куда можно подставить свои данные для работы. Команды terraform следует указывать с подключением файла:  
```bash
terraform plan -var-file ~/diplom/terraform.tfvars

```


