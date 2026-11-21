# caturcilik

## Design reference

Please refer to `DESIGN_GUIDE.md` for all future UI/design changes.

## Docker

Static site served by nginx (non-root, port 8080).

```bash
# Run locally
docker compose up --build        # http://localhost:8080

# Build for multiple platforms (Intel/AMD + Apple Silicon/ARM) and push
docker buildx build --platform linux/amd64,linux/arm64 \
  -t ghcr.io/izuan87/catur-cilik:latest --push .
```

`.dockerignore` is an allowlist, so `config/auth.xlsx` and other non-site files never enter the image.

## Deploy on Ubuntu and Windows laptops

### 1. Install Docker (once per laptop)

**Ubuntu**
```bash
curl -fsSL https://get.docker.com | sudo sh
sudo usermod -aG docker $USER      # then log out and back in
```

**Windows 10/11**
1. Install [Docker Desktop](https://www.docker.com/products/docker-desktop/) (it uses WSL 2; accept the prompts, reboot if asked).
2. Start Docker Desktop and wait until it says "Engine running".

### 2. Get the app onto the laptop

**Option A: from GitHub Container Registry (recommended).** The workflow in
`.github/workflows/docker.yml` builds a multi-arch image and pushes it to
`ghcr.io/izuan87/catur-cilik` on every push to `main`/`master` (or run it manually from the Actions tab).
After the first run, open GitHub > your profile > Packages > `catur-cilik` > Package settings and set
visibility to **Public** so laptops can pull without logging in. If you keep it private, run this on each laptop first
(token needs the `read:packages` scope):
```bash
echo <TOKEN> | docker login ghcr.io -u Izuan87 --password-stdin
```
On each laptop (Ubuntu terminal or Windows PowerShell):
```bash
docker run -d --name catur-cilik -p 8080:8080 --restart unless-stopped ghcr.io/izuan87/catur-cilik:latest
```

**Option B: from the source folder (no registry).** Copy or `git clone` the project to the laptop, then:
```bash
docker compose up -d --build
```

Open http://localhost:8080. Other devices on the same Wi-Fi can use `http://<laptop-ip>:8080`.

### Update to a new version
```bash
# Option A
docker pull ghcr.io/izuan87/catur-cilik:latest
docker rm -f catur-cilik
docker run -d --name catur-cilik -p 8080:8080 --restart unless-stopped ghcr.io/izuan87/catur-cilik:latest

# Option B
docker compose up -d --build
```

### Notes
- Use port 8080 on Windows; port 80 is often taken by other services.
- To start on boot: Ubuntu does this automatically (`--restart unless-stopped`). On Windows, turn on "Start Docker Desktop when you sign in" in its settings.
- To let other devices reach it on Windows, allow Docker Desktop through the firewall when prompted.
- Stop and remove: `docker rm -f catur-cilik` (or `docker compose down`).
