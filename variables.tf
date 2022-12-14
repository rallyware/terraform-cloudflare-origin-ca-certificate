variable "hostnames" {
  type        = list(string)
  description = "A list of hostnames or wildcard names bound to the certificate."
}

variable "request_type" {
  type        = string
  default     = "origin-rsa"
  description = "The signature type desired on the certificate."
}

variable "requested_validity" {
  type        = number
  default     = 5475
  description = "The number of days for which the certificate should be valid."

  validation {
    condition     = contains([7, 30, 90, 365, 730, 1095, 5475], var.requested_validity)
    error_message = "Expected requested_validity to be one of 7, 30, 90, 365, 730, 1095, 5475"
  }
}

variable "tls_cert_request_subject" {
  type = object(
    {
      common_name         = optional(string, "rallyware.com")
      organization        = optional(string, "Rallyware, Inc.")
      country             = optional(string)
      locality            = optional(string)
      organizational_unit = optional(string)
      postal_code         = optional(string)
      province            = optional(string)
      serial_number       = optional(string)
      street_address      = optional(list(string))
    }
  )
  default     = {}
  description = <<-DOC
    An options for tls cert request subject.
    common_name:
        Distinguished name: CN
    country:
        Distinguished name: C
    locality:
        Distinguished name: L
    organization:
        Distinguished name: O
    organizational_unit:
        Distinguished name: OU
    postal_code:
        Distinguished name: PC
    province:
        Distinguished name: ST
    serial_number:
        Distinguished name: SERIALNUMBER
    street_address:
        Distinguished name: STREET
  DOC
}
