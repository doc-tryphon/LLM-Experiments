#!/bin/bash
# Script to initialize and push LLM-Experiments to local Git server
# Run this from the ubuntu-dev-environment container

cd /home/developer/host-projects/LLM-Experiments || exit 1

echo "=== Initializing LLM-Experiments Repository ==="

# Initialize git repo if not already done
if [ ! -d ".git" ]; then
    git init
    echo "✓ Git repository initialized"
else
    echo "✓ Git repository already exists"
fi

# Configure Git
git config user.name "Tryphon"
git config user.email "tryphon@ubuntu-dev"

# Add all files
git add .
echo "✓ Files staged"

# Initial commit
git commit -m "Initial commit: LLM-Experiments repository with AI projects and creative writing"
echo "✓ Initial commit created"

# Create repository on Git server
# You need to create this via the web UI at http://10.0.0.27:3000
echo ""
echo "=== MANUAL STEP REQUIRED ==="
echo "1. Go to http://10.0.0.27:3000"
echo "2. Click '+' → 'New Repository'"
echo "3. Repository name: LLM-Experiments"
echo "4. Make it Private (or Public)"
echo "5. Do NOT initialize with README (we already have one)"
echo "6. Click 'Create Repository'"
echo ""
read -p "Press ENTER after creating the repository..."

# Add remote
git remote add origin ssh://git@10.0.0.27:2222/Tryphon/LLM-Experiments.git
echo "✓ Remote added"

# Push to local Git server
git push -u origin main
echo "✓ Pushed to local Git server"

echo ""
echo "=== SUCCESS ==="
echo "Repository available at: http://10.0.0.27:3000/Tryphon/LLM-Experiments"
echo ""
echo "=== Next: Push to GitHub ==="
echo "To also push to GitHub:"
echo "1. Create repository on GitHub"
echo "2. git remote add github git@github.com:YourUsername/LLM-Experiments.git"
echo "3. git push -u github main"
