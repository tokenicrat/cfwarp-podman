set -e

apk add --no-cache curl

case "$(uname -m)" in
    x86_64) ARCH=amd64 ;;
    aarch64) ARCH=arm64 ;;
    *) echo "Unsupported architecture: $(uname -m)" && exit 1 ;;
esac

curl -sSL "https://github.com/ViRb3/wgcf/releases/download/v${WGCF_VERSION}/wgcf_${WGCF_VERSION}_linux_${ARCH}" -o wgcf
curl -sSL "https://github.com/whyvl/wireproxy/releases/download/v${WIREPROXY_VERSION}/wireproxy_linux_${ARCH}.tar.gz" -o wireproxy.tar.gz
tar -xvzf wireproxy.tar.gz
rm wireproxy.tar.gz
chmod +x wgcf wireproxy

apk del curl
