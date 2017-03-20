#!/bin/bash
set -e
cat > config/private.yml << EOF
---
blobstore:
  s3:
    access_key_id: ${S3_ACCESS_KEY_ID}
    secret_access_key: ${S3_SECRET_ACCESS_KEY}
EOF