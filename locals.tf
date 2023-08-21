locals {
  common_tags = {
    projeto  = var.nome
    ambiente = var.tag-ambiente
    dono     = var.tag-dono
    ccusto   = var.tag-ccusto
  }
}
