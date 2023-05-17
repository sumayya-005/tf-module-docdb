resource "null_resource" "load_schema" {
  depends_on = [aws_docdb_cluster.docdb,aws_docdb_cluster_instance.cluster_instances]

  provisioner "local-exec" {
    command = <<EOF

curl -s -L -o /tmp/mongodb.zip "https://github.com/roboshop-devops-project/mongodb/archive/main.zip"
cd /tmp
unzip mongodb.zip
cd mongodb-main
curl -L -O https://s3.amazonaws.com/rds-downloads/rds-combined-ca-bundle.pem
mongo --ssl --host dev-db1-roboshop-docdb.cluster-cjjzk2q3bnco.us-east-1.docdb.amazonaws.com:27017 --sslCAFile
 rds-combined-ca-bundle.pem --username admin1 --password <insertYourPassword>

EOF
  }
}