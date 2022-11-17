# terraform-cloudflare-origin-ca-certificate
Terraform module to provision Cloudflare Origin CA certificate used to protect traffic to your origin without involving a third party Certificate Authority.

<!-- BEGIN_TF_DOCS -->
## Usage
```hcl
module "origin_ca" {
  source = "../../"

  hostnames = ["*.rallyware.com"]
}
```
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.3 |
| <a name="requirement_cloudflare"></a> [cloudflare](#requirement\_cloudflare) | >= 3.0 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |
## Providers

| Name | Version |
|------|---------|
| <a name="provider_cloudflare"></a> [cloudflare](#provider\_cloudflare) | >= 3.0 |
| <a name="provider_tls"></a> [tls](#provider\_tls) | >= 3.0 |
## Modules

No modules.
## Resources

| Name | Type |
|------|------|
| [cloudflare_origin_ca_certificate.default](https://registry.terraform.io/providers/cloudflare/cloudflare/latest/docs/resources/origin_ca_certificate) | resource |
| [tls_cert_request.default](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/cert_request) | resource |
| [tls_private_key.default](https://registry.terraform.io/providers/hashicorp/tls/latest/docs/resources/private_key) | resource |
## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hostnames"></a> [hostnames](#input\_hostnames) | A list of hostnames or wildcard names bound to the certificate. | `list(string)` | n/a | yes |
| <a name="input_tls_cert_request_subject"></a> [tls\_cert\_request\_subject](#input\_tls\_cert\_request\_subject) | n/a | <pre>object(<br>    {<br>      common_name         = optional(string, "rallyware.com")<br>      organization        = optional(string, "Rallyware, Inc.")<br>      country             = optional(string)<br>      locality            = optional(string)<br>      organizational_unit = optional(string)<br>      postal_code         = optional(string)<br>      province            = optional(string)<br>      serial_number       = optional(string)<br>      street_address      = optional(list(string))<br>    }<br>  )</pre> | n/a | yes |
| <a name="input_request_type"></a> [request\_type](#input\_request\_type) | The signature type desired on the certificate. | `string` | `"origin-rsa"` | no |
| <a name="input_requested_validity"></a> [requested\_validity](#input\_requested\_validity) | The number of days for which the certificate should be valid. | `number` | `1095` | no |
## Outputs

| Name | Description |
|------|-------------|
| <a name="output_certificate"></a> [certificate](#output\_certificate) | The Origin CA certificate. |
| <a name="output_expires_on"></a> [expires\_on](#output\_expires\_on) | The datetime when the certificate will expire. |
| <a name="output_id"></a> [id](#output\_id) | The x509 serial number of the Origin CA certificate. |
| <a name="output_private_key_pem"></a> [private\_key\_pem](#output\_private\_key\_pem) | Private key data in PEM (RFC 1421) format. |
<!-- END_TF_DOCS -->

## License
The Apache-2.0 license