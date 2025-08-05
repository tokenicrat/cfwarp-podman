set -e

apk add --no-cache curl

curl -sSL "https://github.com/ViRb3/wgcf/releases/download/v${WGCF_VERSION}/wgcf_${WGCF_VERSION}_linux_amd64" -o wgcf
curl -sSL "https://github.com/whyvl/wireproxy/releases/download/v${WIREPROXY_VERSION}/wireproxy_linux_amd64.tar.gz" -o wireproxy.tar.gz
tar -xvzf wireproxy.tar.gz
rm wireproxy.tar.gz
chmod +x wgcf wireproxy

apk del curl
