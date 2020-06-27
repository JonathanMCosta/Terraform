A infraestrutura consiste em um balanceamento já com Apache instalado, BAse de dados MySql e alarme de balanceamento

É necessário alterar a linha 34 do arquivo 1 - Variables.tf, pois nessa linha encontra-se a chave de acesso SSH.

Caso queira, altera também a linha 26, nela encontra-se o código ami para a máquina a ser criada, na linha 30 está o tipo de instância.

A região está logo no inicio do arquivo.

Execute os seguintes comandos: terraform init, terraform plan e em seguida terraform apply

terraform init - Este comando é usado para inicializar um diretório de trabalho que contém os arquivos de configuração do Terraform.

terraform plan - Este comando é usado para criar um plano de execução.

terraform apply - Este comando é usado para aplicar as alterações necessárias para alcançar o estado desejado da configuração ou o conjunto predeterminado de ações geradas por um terraform planplano de execução.