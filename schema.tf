#resource "null_resource" "load_schema" {
#  depends_on = [aws_docdb_cluster.docdb,aws_docdb_cluster_instance.cluster_instances]
#
#  provisioner "local-exec" {}
#}