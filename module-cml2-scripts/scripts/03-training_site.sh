#!/bin/bash

#
# This file is part of Cisco Modeling Labs
# Copyright (c) 2019-2023, Cisco Systems, Inc.
# All rights reserved.
#

# Add training site config to NGINX.  This typically points to a
# Github pages site.

echo "03-training_site start"

# Towards the end of the HTTPS CML server configuration...
sed -ie 's/# ATTENTION THIS/include \/etc\/nginx\/training-site.conf;\n  # ATTENTION THIS/' /etc/nginx/conf.d/controller.conf

# TODO cmm - templatize using config?
cat <<'EOF' > /etc/nginx/training-site.conf
location /training {
  include /etc/nginx/security-headers.conf;
  #include /etc/nginx/csp.conf;

  rewrite ^/training$ /bah-site break;

  proxy_pass              https://cmm-cisco.github.io/bah-site;
  proxy_redirect          default;
  proxy_buffering         off;
  proxy_set_header        Host                    cmm-cisco.github.io;
  proxy_set_header        X-Real-IP               $remote_addr;
  proxy_set_header        X-Forwarded-For         $proxy_add_x_forwarded_for;
  proxy_set_header        X-Forwarded-Protocol    $scheme;
}
EOF

systemctl restart nginx

#apt install -y npm
#
## 1.14 and later isn't compatible with Ubuntu 20.04 built-in node
#npm -g install js-beautify@1.13
#
## Unminify CMLs main Javascript for later mods
#for i in /var/lib/nginx/html/assets/index-*.js; do [ -f "$i" ] && js-beautify -r "$i"; done

echo "03-training_site finish"