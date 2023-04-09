resource "aws_docdb_subnet_group" "default" {
  for_each   = var.docdb
  name       = "${var.env}-${each.key}-roboshop-docdb"
  subnet_ids = [aws_subnet.frontend.id, aws_subnet.backend.id]

  tags = {
    Name = "My docdb subnet group"
  }
}


resource "aws_docdb_cluster" "docdb" {
  for_each                = var.docdb
  cluster_identifier      = "${var.env}-roboshop-docdb"
  engine                  = "docdb"
  master_username         = "admin1"
  master_password         = "mustbeeightchars"
  skip_final_snapshot     = true
  db_subnet_group_name    = "${var.env}-${each.key}-roboshop-docdb"
}