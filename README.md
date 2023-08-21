# Criando uma Máquina Virtual no Azure com Terraform

Estou iniciando meus estudos com Terraform e este é meu segundo projeto. 

- Primeiramente tenha uma conta na [Azure](https://azure.microsoft.com/pt-br/free/).
- Tenha ou Instale o [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli) no seu Computador.
- Tenha ou Instale o [Azure](https://learn.microsoft.com/en-us/cli/azure/install-azure-cli) Cli no seu Computador.

## Detalhes do Projeto

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


## Faça o clone para sua Estação

```
git clone https://github.com/julianorib/terraform-azure-vm.git
```

## Ajustes no Projeto

- Defina algumas variáveis se for de sua necessidade (terraform.tfvars):

    nome, user-vm1, tag-ambiente, tag-ccusto, tag-dono, location, sizevm

- Confira o caminho de sua Chave Pública SSH no main.tf (~/.ssh/id_rsa.pub)



## Autenticação no Provedor

Eu faço login pelo Azure CLI.

```
az login 
```


## Execute para Criação
```
terraform init

```
```
terraform apply

```


## Execute para Remoção:

```
terraform destroy
```

## Informações úteis

Tamanhos de Maquinas Virtuais Linux:
https://learn.microsoft.com/en-us/azure/virtual-machines/sizes

Preços de Maquinas Virtuais Linux:
https://azure.microsoft.com/en-us/pricing/details/virtual-machines/linux/

Como consultar e utilizar Imagens (ISO) Linux:
https://learn.microsoft.com/en-us/azure/virtual-machines/linux/cli-ps-findimage

