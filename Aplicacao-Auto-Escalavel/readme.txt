A infraestrutura consiste em um balanceamento j� com Apache instalado, BAse de dados MySql e alarme de balanceamento

� necess�rio alterar a linha 34 do arquivo 1 - Variables.tf, pois nessa linha encontra-se a chave de acesso SSH.

Caso queira, altera tamb�m a linha 26, nela encontra-se o c�digo ami para a m�quina a ser criada, na linha 30 est� o tipo de inst�ncia.

A regi�o est� logo no inicio do arquivo.

Execute os seguintes comandos: terraform init, terraform plan e em seguida terraform apply

terraform init - Este comando � usado para inicializar um diret�rio de trabalho que cont�m os arquivos de configura��o do Terraform.

terraform plan - Este comando � usado para criar um plano de execu��o.

terraform apply - Este comando � usado para aplicar as altera��es necess�rias para alcan�ar o estado desejado da configura��o ou o conjunto predeterminado de a��es geradas por um terraform planplano de execu��o.