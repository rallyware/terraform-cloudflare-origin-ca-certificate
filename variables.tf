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
  default     = 1095
  description = "The number of days for which the certificate should be valid."
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
}
