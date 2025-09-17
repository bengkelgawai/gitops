# SFTP Distributor ArgoCD Application

This directory contains a simple ArgoCD application for distributing files to remote servers via SFTP using an Alpine-based container.

## Components
- **application.yaml**: ArgoCD application manifest.
- **deployment.yaml**: Kubernetes deployment for the Alpine container running the SFTP distribution script.
- **configmap.yaml**: Contains the shell script and a list of target hosts.
- **secret.yaml**: Stores SFTP credentials (username and password).

## How It Works
- The Alpine container runs a shell script (`distribute.sh`) on startup.
- The script uses `sshpass` and `sftp` to send files from `/files/` to each host listed in the ConfigMap.
- Credentials are injected via Kubernetes Secrets.

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
- `sshpass` available in the Alpine image (add to Dockerfile if needed)

---
For customizations or troubleshooting, edit the manifests as needed.