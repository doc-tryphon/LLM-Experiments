# PowerShell script to populate LLM-Experiments repository
# Run this from: C:\Users\tryph\ubuntu-dev-environment\projects\LLM-Experiments

$baseDir = "C:\Users\tryph\ubuntu-dev-environment\projects\LLM-Experiments"
Set-Location $baseDir

# Create directory structure
$dirs = @(
    "AI project outlines folder\Wormhole-Stability-Analysis Project",
    "creative writing\Disaster-relief-tools-folder",
    "creative writing\Halo-short-story-folder"
)

foreach ($dir in $dirs) {
    New-Item -ItemType Directory -Force -Path $dir | Out-Null
}

# AI Project Outlines folder README
@"
This folder contains different AI based projects that I have drafted up with the help of various free-to-use LLM's
"@ | Set-Content "AI project outlines folder\Read me.md"

# Creative Writing folder README  
@"
This is a folder for all of the creative writing projects I have done with a variety of free-to-use LLM's
"@ | Set-Content "creative writing\read me.md"

# Disaster Relief README
@"
# Disaster Relief Tools Folder

This folder contains a collection of **AI-generated tools and templates** designed to assist in disaster relief efforts. These tools are intended to streamline planning, coordination, and execution of relief missions, ensuring efficient and effective responses to emergencies.

---

## Folder Contents

The folder includes the following resources:

1. **Priority Briefing Template**: A customizable template for creating mission briefings for disaster relief operations.
2. **Supply Chain Optimization Tools**: AI-generated tools for managing and optimizing the distribution of relief supplies.
3. **Volunteer Coordination Tools**: Templates and scripts for organizing and assigning roles to volunteers.
4. **Risk Assessment Frameworks**: AI-generated frameworks for evaluating safety and security risks in disaster zones.
5. **Communication Protocols**: Templates for establishing clear communication channels during relief efforts.
6. **Contingency Planning Tools**: Resources for developing backup plans and alternative strategies.

---

## How to Use

1. **Customize Templates**: Replace placeholders in the templates with specific details relevant to your disaster relief scenario.
2. **Integrate Tools**: Use the provided tools to enhance planning, logistics, and coordination efforts.
3. **Collaborate**: Share these resources with your team and other relief organizations to ensure a unified approach.

---

## Contributing

Contributions to this repository are welcome! If you have additional tools, templates, or improvements to existing resources, feel free to open an issue or submit a pull request.

---

For questions or support, please reach out to Doc Tryphon.
"@ | Set-Content "creative writing\Disaster-relief-tools-folder\Read me.md"

# Halo Story README
@"
# Grok 3.0 Beta Halo Short Story

Welcome to the folder containing the **Grok 3.0 Beta-generated Halo short story**! This story was created using Grok 3.0 Beta, an advanced AI model, and is set in the iconic *Halo* universe. It explores new characters, thrilling action, and the rich lore of the Halo franchise, all while showcasing the creative potential of AI-generated storytelling.

---

## About the Story

- **Title**: [SHADOW VEIL]
- **Setting**: The story takes place in the *Halo* universe, featuring familiar thematic writing elements as seen in Eric Nylunds early Halo book series.
- **Characters**: Includes both original characters created by Grok 3.0 Beta and references to well-known figures from the Halo lore.
- **Themes**: Sacrifice, loyalty, and the blurred lines between heroism and rogue action in the face of overwhelming odds.

---

## Folder Contents (Work in progress)

1. **Short Story Text**: The full text of the AI-generated Halo short story.
2. **Character Profiles**: Descriptions of the original characters featured in the story.
3. **Lore References**: A guide to the Halo lore elements mentioned in the story.
4. **AI Prompt Details**: The input prompts used to generate the story with Grok 3.0 Beta.
5. **Visual Assets (Optional)**: AI-generated artwork or concept images inspired by the story.

---

## How to Use

- **Read the Story**: Dive into the narrative and enjoy the creative output of Grok 3.0 Beta.
- **Explore the Lore**: Use the included references to deepen your understanding of the Halo universe.
- **Experiment with AI**: Modify the prompts or generate new stories using Grok 3.0 Beta.

---

## Contributing

If you have suggestions for improving the story, additional lore insights, or ideas for new AI-generated Halo content, feel free to open an issue or submit a pull request.

---

For questions or feedback, please reach out to [Doc Tryphon].
"@ | Set-Content "creative writing\Halo-short-story-folder\Read-me.md"

Write-Host "Repository structure created successfully!" -ForegroundColor Green
Write-Host "Next steps:"
Write-Host "1. Initialize git repo"
Write-Host "2. Add content files"
Write-Host "3. Commit and push to local git server"
