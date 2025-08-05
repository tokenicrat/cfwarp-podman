/app/wgcf register --accept-tos \
    && echo "   OK   Cloudflare WARP account registered" \
    || (echo " ERROR  Failed to register Cloudflare WARP account"; exit 1)
if [ -n "$WARP_LICENSE_KEY" ]; then
    echo "  INFO  WARP+ key detected"
    sed -i "s/^license_key = .*/license_key = '${WARP_LICENSE_KEY}'/" /app/wgcf-account.toml \
        && echo "   OK   WARP+ key applied" \
        || (echo " ERROR  Failed to apply WARP+ key"; exit 1)
fi
/app/wgcf generate \
    && echo "   OK   WireGuard profile generated" \
    || (echo " ERROR  Failed to generate WireGuard profile"; exit 1)

/app/wireproxy -n -c /app/wgcf-profile.conf \
    && echo "   OK   Valid WireGuard profile" \
    || (echo " ERROR   Invalid WireGuard profile"; exit 1)

/app/wireproxy -c "/app/default.conf" 
