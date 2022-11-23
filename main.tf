resource "tls_private_key" "default" {
  algorithm = "RSA"
}

resource "tls_cert_request" "default" {
  private_key_pem = tls_private_key.default.private_key_pem
  dns_names       = var.hostnames

  subject {
    common_name         = var.tls_cert_request_subject["common_name"]
    organization        = var.tls_cert_request_subject["organization"]
    country             = var.tls_cert_request_subject["country"]
    locality            = var.tls_cert_request_subject["locality"]
    organizational_unit = var.tls_cert_request_subject["organizational_unit"]
    postal_code         = var.tls_cert_request_subject["postal_code"]
    province            = var.tls_cert_request_subject["province"]
    serial_number       = var.tls_cert_request_subject["serial_number"]
    street_address      = var.tls_cert_request_subject["street_address"]
  }
}

resource "cloudflare_origin_ca_certificate" "default" {
  csr                = tls_cert_request.default.cert_request_pem
  hostnames          = var.hostnames
  request_type       = var.request_type
  requested_validity = var.requested_validity
}
