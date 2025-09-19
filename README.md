# GitOps SFTP Distributor Apps

This repository contains two SFTP distributor applications for Kubernetes, each with a different deployment approach:

## 1. sftp-distributor-customimage
- **Purpose:** Uses a custom Docker image with the SFTP distribution script baked into the image.
- **Location:** `sftp-distributor-customimage/`
- **How it works:**
	- The script (`distribute.sh`) and Dockerfile are included in the directory.
	- GitHub Actions workflow automatically builds and pushes the image to DockerHub on every commit to `master`.
	- The deployment manifest references this custom image.
- **Use case:**
	- When you want full control over the container environment and dependencies.
	- Useful if you need additional tools or customizations in the image.

## 2. sftp-distributor
- **Purpose:** Uses the public Alpine image and injects the SFTP distribution script via a Kubernetes ConfigMap.
- **Location:** `sftp-distributor/`
- **How it works:**
	- The script is stored in a ConfigMap and mounted into the container at runtime.
	- No custom image build is required; deployment uses `alpine:latest`.
- **Use case:**
	- When you want a lightweight, fast deployment without building/pushing images.
	- Easier to update the script by changing the ConfigMap.

## Differences
| Feature                | sftp-distributor-customimage | sftp-distributor |
|------------------------|-----------------------------|-----------------|
| Image build required   | Yes                         | No              |
| Script location        | In Docker image             | In ConfigMap    |
| Dependencies control   | Full (via Dockerfile)       | Limited (Alpine only) |
| Update script          | Rebuild image               | Update ConfigMap |
| GitHub Actions         | Yes (builds/pushes image)   | No              |

## GitHub Actions Workflow
- The workflow in `.github/workflows/docker-build.yml` only builds the custom image in `sftp-distributor-customimage`.
- It triggers on changes to `Dockerfile`, `distribute.sh`, or the workflow file itself.
- For the `sftp-distributor` app, no workflow is needed as it uses a public image and ConfigMap.

## Usage
- Choose the app directory that fits your needs and point your ArgoCD Application manifest to it.
- Update secrets and ConfigMaps as needed for your environment.

---
For more details, see the manifests in each app directory.