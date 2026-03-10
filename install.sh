#!/bin/bash

# Frontend Design Master - Interactive Installer
# Created by Hanan Bhatti

RED='\033[0;31m'
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

echo -e "${BLUE}==========================================${NC}"
echo -e "${BLUE}   🎨 Frontend Design Master Installer    ${NC}"
echo -e "${BLUE}==========================================${NC}"

# 1. Select Agents (Top AI Agents)
echo -e "\n${YELLOW}Step 1: Select your AI Agents (Space to select, Enter to confirm)${NC}"
AGENTS=("Claude Code" "GitHub Copilot CLI" "Codex" "Cursor" "Windsurf" "Aider" "Continue" "Supermaven")
SELECTED_AGENTS=()

# Basic multi-select implementation for bash
for i in "${!AGENTS[@]}"; do
    echo "$((i+1))) ${AGENTS[$i]}"
done

read -p "Enter numbers separated by space (e.g., 1 2): " choices
for choice in $choices; do
    SELECTED_AGENTS+=("${AGENTS[$((choice-1))]}")
done

echo -e "${GREEN}Selected: ${SELECTED_AGENTS[*]}${NC}"

# 2. Select Link Type
echo -e "\n${YELLOW}Step 2: Select Installation Type${NC}"
echo "1) Symlink (Recommended - updates automatically with git pull)"
echo "2) Copy (Standalone - static version)"
read -p "Selection (1/2): " LINK_TYPE_CHOICE

INSTALL_CMD="ln -sf"
[[ "$LINK_TYPE_CHOICE" == "2" ]] && INSTALL_CMD="cp -r"

# 3. Select Scope
echo -e "\n${YELLOW}Step 3: Select Scope${NC}"
echo "1) Global (Available for all projects)"
echo "2) Project (Local to this directory only)"
read -p "Selection (1/2): " SCOPE_CHOICE

# 4. Define Skill Name & Check for Conflicts
DEFAULT_NAME="frontend-design-master"
echo -e "\n${YELLOW}Step 4: Naming${NC}"
read -p "Enter skill name [$DEFAULT_NAME]: " SKILL_NAME
SKILL_NAME=${SKILL_NAME:-$DEFAULT_NAME}

# Function to perform installation
install_skill() {
    local platform_path=$1
    local name=$2
    
    if [[ -d "$platform_path/$name" ]] || [[ -L "$platform_path/$name" ]]; then
        echo -e "${RED}Conflict: '$name' already exists in $platform_path${NC}"
        read -p "Rename to avoid conflict? (y/n): " do_rename
        if [[ "$do_rename" == "y" ]]; then
            name="${name}-custom-$(date +%s)"
            echo -e "${BLUE}New name: $name${NC}"
        else
            echo "Skipping installation for this platform."
            return
        fi
    fi

    mkdir -p "$platform_path"
    $INSTALL_CMD "$(pwd)/skill" "$platform_path/$name"
    echo -e "${GREEN}Successfully installed '$name' to $platform_path${NC}"
}

# Execute installation based on selections
for agent in "${SELECTED_AGENTS[@]}"; do
    case $agent in
        "Claude Code")
            BASE_PATH=("$HOME/.claude/skills" ".claude/skills")
            ;;
        "GitHub Copilot CLI")
            BASE_PATH=("$HOME/.copilot/skills" ".github/skills")
            ;;
        "Codex")
            BASE_PATH=("$HOME/.codex/skills" ".codex/skills")
            ;;
        *)
            echo -e "${RED}Custom installation path needed for $agent${NC}"
            read -p "Enter path: " custom_path
            BASE_PATH=("$custom_path" "$custom_path")
            ;;
    esac

    if [[ "$SCOPE_CHOICE" == "1" ]]; then
        install_skill "${BASE_PATH[0]}" "$SKILL_NAME"
    else
        install_skill "${BASE_PATH[1]}" "$SKILL_NAME"
    fi
done

echo -e "\n${GREEN}Installation Complete! 🎉${NC}"
echo -e "You can now trigger the skill by asking for 'design UI' or 'Neo-Brutalism style'."
