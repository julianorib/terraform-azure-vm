# Criando uma Máquina Virtual no Azure com Terraform

Estou iniciando meus estudos com Terraform e este é meu segundo projeto. 

# Iniciando

- Primeiramente tenha uma conta na [Azure](https://azure.microsoft.com/pt-br/free/).
- Tenha ou Instale o [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) no seu Computador.
- Tenha ou Instale o [Azure](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) Cli no seu Computador.
- Baixe este projeto e acesse sua pasta
- Defina algumas variáveis se for de sua necessidade (terraform.tfvars):

    nome, user-vm1, tag-ambiente, tag-ccusto, tag-dono, location, sizevm
- Faça login na sua conta com o comando:

    az login 
- terraform init
- terraform apply

# Detalhes do Projeto

Este projeto cria os seguintes Recursos:

- Grupo de Recursos
- Virtual Network (VNET)
- Subnet 
- IP Público
- Interface de Rede (NIC)
- Grupo de Segurança (NSG)
    Com acesso SSH (inbound)
    Com acesso a Internet (outbound)
- Máquina Virtual Ubuntu (Virtual Machine)
- Mostra o IP Publico ao final

# Informações úteis

Tamanhos de Maquinas Virtuais Linux:
https://learn.microsoft.com/en-us/azure/virtual-machines/sizes

Preços de Maquinas Virtuais Linux:
https://azure.microsoft.com/en-us/pricing/details/virtual-machines/linux/

Como consultar e utilizar Imagens (ISO) Linux:
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/cli-ps-findimage

