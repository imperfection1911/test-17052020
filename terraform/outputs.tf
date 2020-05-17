locals {
  ip = aws_instance.web.public_ip
}

data "template_file" "web" {
  template = <<EOF
[web]
${local.ip}
EOF
}

output "web" {
  value = data.template_file.web.rendered
}