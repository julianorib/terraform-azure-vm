variable "nome" {
  type        = string
  description = "Nome do projeto"
  default     = "Exemplo"
}

variable "user-vm1" {
  type        = string
  description = "Usuario da Maquina Virtual 01"
  default     = "usuario"
}

variable "tag-dono" {
  type        = string
  description = "Dono do projeto"
  default     = "Dono"
}

variable "tag-ambiente" {
  type        = string
  description = "Ambiente do projeto"
  default     = "Testes"
}

variable "tag-ccusto" {
  type        = string
  description = "Centro de Custo do projeto"
  default     = "Tecnologia"
}

variable "location" {
  type        = string
  description = "Localização dos Recursos"
  default     = "brazilsouth"

}

variable "sizevm" {
  type        = string
  description = "Tipo de Maquina Virtual"
  default     = "Standard_B1s"
}

