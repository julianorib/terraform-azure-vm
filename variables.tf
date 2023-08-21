variable "nome" {
  type        = string
  description = "Nome do projeto"
  default     = "projetox"
}

variable "user-vm1" {
  type        = string
  description = "Usuario da Maquina Virtual 01"
  default     = "user"
}

variable "tag-dono" {
  type        = string
  description = "Dono do projeto"
}

variable "tag-ambiente" {
  type        = string
  description = "Ambiente do projeto"
}

variable "tag-ccusto" {
  type        = string
  description = "Centro de Custo do projeto"
}

