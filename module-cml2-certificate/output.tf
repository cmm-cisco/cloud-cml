#
# This file is part of Cisco Modeling Labs
# Copyright (c) 2019-2023, Cisco Systems, Inc.
# All rights reserved.
#

output "certificate_arn" {
  value = aws_acm_certificate.cml2_cert.arn
}

output "certificate_arn_valid_id" {
  value = resource.aws_acm_certificate_validation.cml_cert_valid.id
}
