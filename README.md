# SFTP Distributor ArgoCD Application

This repository contains a simple ArgoCD application for distributing files to remote servers via SFTP using an Alpine-based container.

## Components
- **argocd-app/application.yaml**: ArgoCD application manifest.
- **argocd-app/sftp-distributor/deployment.yaml**: Kubernetes deployment for the Alpine container running the SFTP distribution script.
- **argocd-app/sftp-distributor/configmap.yaml**: Contains the shell script and a list of target hosts.
- **argocd-app/sftp-distributor/secret.yaml**: Stores SFTP credentials (username and password).
- **Dockerfile**: Custom image for SFTP distribution.
- **distribute.sh**: SFTP distribution script.
- **.github/workflows/docker-build.yml**: GitHub Actions workflow for building and pushing the Docker image.

## Usage
1. Update `configmap.yaml` with your target hosts.
2. Update `secret.yaml` with your SFTP username and password.
3. Place files to distribute in the `/files/` directory (mount as needed).
4. Apply manifests to your cluster and sync with ArgoCD.

## Security
- Store sensitive credentials securely.
- Consider using network policies and RBAC for access control.

## Requirements
- Kubernetes cluster
- ArgoCD installed
- `sshpass` available in the Alpine image (already included)

---
For customizations or troubleshooting, edit the manifests as needed.