#
# This file is part of Cisco Modeling Labs
# Copyright (c) 2019-2023, Cisco Systems, Inc.
# All rights reserved.
#

output "public_ip" {
  value = aws_instance.cml.public_ip
}

output "security_group_id" {
  value = aws_security_group.sg-tf.id
}

output "target_group_attachment_id" {
  value = aws_lb_target_group_attachment.cml2.id
}
