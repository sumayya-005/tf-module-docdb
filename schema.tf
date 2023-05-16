resource "null_resource" "load_schema" {
  depends_on = [aws]
}