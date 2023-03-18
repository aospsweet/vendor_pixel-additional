#!/bin/bash

if [ ! -d .repo/local_manifests ];
then
    mkdir -p .repo/local_manifests
fi

cp -Rf vendor/pixel-additional/pixel-additional.xml .repo/local_manifests/pixel-additional.xml

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all) prebuilts/module_sdk

repo sync -c --force-sync --optimized-fetch --no-tags --no-clone-bundle --prune -j$(nproc --all) vendor/partner_modules

rm -Rf vendor/gapps/product/packages/apps/PrebuiltGoogleAdservicesTvp
rm -Rf vendor/gapps/product/packages/apps/PrebuiltGoogleTelemetryTvp
rm -Rf vendor/gapps/system/packages/apps/CaptivePortalLoginGoogle
rm -Rf vendor/gapps/system/packages/privileged_apps/DocumentsUIGoogle
rm -Rf vendor/gapps/system/packages/privileged_apps/NetworkStackGoogle
rm -Rf vendor/aosp/rro_overlays/GooglePermissionControllerOverlay

rm -Rf vendor/partner_modules/build/certificates/bluetooth.x509.pem
cp vendor/pixel-additional/apex/certificates/bluetooth.x509.pem vendor/partner_modules/build/certificates/
