output "id" {
  value       = cloudflare_origin_ca_certificate.default.id
  description = "The x509 serial number of the Origin CA certificate."
}

output "certificate" {
  sensitive   = true
  value       = cloudflare_origin_ca_certificate.default.certificate
  description = "The Origin CA certificate."
}

output "expires_on" {
  value       = cloudflare_origin_ca_certificate.default.expires_on
  description = "The datetime when the certificate will expire."
}

output "private_key_pem" {
  sensitive   = true
  value       = tls_private_key.default.private_key_pem
  description = "Private key data in PEM (RFC 1421) format."
}
