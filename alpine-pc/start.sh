#!/bin/bash

# Retrieve app from S3
cd ${APP_ROOT}
aws s3api get-object --bucket ${AWS_S3_BUCKET} --key ${AWS_S3_KEY} app.zip

# Unzip app
unzip app.zip

# Remove Zip file
rm app.zip

# Chown
chown -R ${PUID}:${GUID} ${APP_ROOT}

# Start supervisord and services
exec /usr/bin/supervisord -n -c /etc/supervisord.conf