# CF WARP Podman

[📦 **GHCR: tokenicrat/cfwarp**](https://ghcr.io/tokenicrat/cfwarp)

Cloudflare WARP 的简易 Podman 封装

## 快速开始

先决条件：

- cURL
- Podman 和 Podman Compose 正确安装并启用
  - 也可使用 Docker 和 Docker Compose，将命令替换为 `podman`

```bash
curl -O -sSL https://raw.githubusercontent.com/tokenicrat/cfwarp-podman/main/compose.yml
docker compose up -d
```

若不希望使用 Compose，通过命令行启动：

```bash
podman run -d \
  --name cfwarp \
  --restart always \
  -p 5000:5000 \
  -p 5001:5001 \
  ghcr.io/tokenicrat/cfwarp:latest

```

## 使用

默认 SOCKS5 端口为 `5000`，HTTP 端口为 `5001`，可以在 `compose.yml` 中修改映射。

测试：

```bash
curl https://www.google.com -x http://localhost:5001 # 假设运行于本地
curl https://www.google.com -x socks://localhost:5000
```

如果您拥有 WARP+ 密钥，请在 Compose 中取消注释并填入。重启容器即可重新生成密钥；IP 由 Cloudflare 分配，无法实现更换。

本仓库也许无法长期维护，wgcf 和 wireproxy 版本可能过时。您可以 fork 本仓库，手动修改 `Containerfile` 内版本号生成镜像。

## 结构

先通过 [wgcf](https://github.com/ViRb3/wgcf) 获取 Cloudflare WARP 免费版密钥，生成 WireGuard 配置，然后使用 [wireproxy](https://github.com/whyvl/wireproxy) 转换为 SOCKS5 和 HTTP 代理。

Cloudflare WARP 的 CLI 客户端实际上提供了代理模式，但是该客户端存在内存泄漏问题，Cloudflare 也没有解决的计划，因此可用性较差。

## 协议

MIT
