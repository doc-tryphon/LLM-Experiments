# LLM-Experiments Repository Setup Guide

## Overview
This repository has been created in your ubuntu-dev-environment and is ready to be pushed to both your local Git server and GitHub.

## Current Structure
```
LLM-Experiments/
├── README.md
├── AI project outlines folder/
│   ├── AI training folder/
│   │   ├── Enterprise-ai-training.md
│   │   └── Read me.md
│   ├── Brain Computer Interface folder/
│   │   ├── BCI Interface.md
│   │   └── Read me.md
│   ├── Wormhole-Stability-Analysis Project/
│   └── Read me.md
└── creative writing/
    ├── Disaster-relief-tools-folder/
    │   └── Read me.md
    ├── Halo-short-story-folder/
    │   └── Read-me.md
    └── read me.md
```

## Setup Steps

### 1. Run the Population Script (Optional)
If you need to create additional directories:
```powershell
cd C:\Users\tryph\ubuntu-dev-environment\projects\LLM-Experiments
.\populate-repo.ps1
```

### 2. Initialize Git Repository

**Option A: From Windows (PowerShell)**
```powershell
cd C:\Users\tryph\ubuntu-dev-environment\projects\LLM-Experiments
git init
git add .
git commit -m "Initial commit: LLM-Experiments repository"
```

**Option B: From Ubuntu Container**
```bash
# Access the container
docker exec -it ubuntu-workstation zsh

# Navigate to the project
cd ~/host-projects/LLM-Experiments

# Run the initialization script
chmod +x init-git.sh
./init-git.sh
```

### 3. Create Repository on Local Git Server

1. Open web browser to http://10.0.0.27:3000
2. Login to Gitea
3. Click the '+' icon → 'New Repository'
4. Fill in:
   - **Owner**: Tryphon
   - **Repository Name**: LLM-Experiments
   - **Visibility**: Private (or Public, your choice)
   - **DO NOT** check "Initialize repository"
5. Click 'Create Repository'

### 4. Push to Local Git Server

```bash
# Add the remote
git remote add origin ssh://git@10.0.0.27:2222/Tryphon/LLM-Experiments.git

# Push
git push -u origin main
```

### 5. Also Push to GitHub (Optional)

**Create GitHub Repository:**
1. Go to https://github.com/new
2. Repository name: LLM-Experiments
3. DO NOT initialize with README
4. Create repository

**Add GitHub Remote and Push:**
```bash
# Add GitHub as a second remote
git remote add github git@github.com:YourUsername/LLM-Experiments.git

# Push to GitHub
git push -u github main
```

## Adding Content

To add the full document content (the files you shared with Claude):

### From the Documents
You have content for:
- Metaheuristic algorithm use cases
- Wormhole stability analysis guides
- Disaster relief mission briefings
- Halo short stories
- And more...

You can either:
1. Copy/paste from your original documents
2. Ask Claude to create individual files
3. Add them manually through Git later

## Workflow Tips

### Syncing Between Local Git Server and GitHub

```bash
# Pull from local server
git pull origin main

# Pull from GitHub
git pull github main

# Push to both
git push origin main
git push github main

# Or create an alias
git config alias.push-all '!git push origin main && git push github main'
git push-all
```

### Development Workflow

1. **Edit** files in VS Code on Windows
2. **Commit** to local Git server for backup
3. **Test** in Ubuntu container if needed
4. **Push** to GitHub for public sharing

## Troubleshooting

### SSH Key Issues
If you get authentication errors:
```bash
# Check SSH key is added to Git server
ssh -T git@10.0.0.27 -p 2222

# Should show: "Hi there, Tryphon! You've successfully authenticated..."
```

### Permission Issues
```bash
# Make sure you own the files
sudo chown -R developer:developer ~/host-projects/LLM-Experiments
```

## Next Steps

1. ✅ Repository structure created
2. ⏳ Initialize Git
3. ⏳ Create on local Git server
4. ⏳ Push to local Git server
5. ⏳ (Optional) Push to GitHub
6. ⏳ Add remaining content files

---

**Need help?** Ask Claude to:
- Create specific content files
- Add documentation
- Set up Git workflows
- Configure CI/CD pipelines
