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
    index=$((choice-1))
    if [[ $index -ge 0 && $index -lt ${#AGENTS[@]} ]]; then
        SELECTED_AGENTS+=("${AGENTS[$index]}")
    fi
done

if [[ ${#SELECTED_AGENTS[@]} -eq 0 ]]; then
    echo -e "${RED}No agents selected. Exiting.${NC}"
    exit 1
fi

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
    
    # Ensure the parent directory exists without deleting it
    mkdir -p "$platform_path"

    if [[ -d "$platform_path/$name" ]] || [[ -L "$platform_path/$name" ]]; then
        echo -e "${YELLOW}Notice: '$name' already exists in $platform_path${NC}"
        read -p "Overwrite existing? (y/n) [n]: " do_overwrite
        if [[ "$do_overwrite" != "y" ]]; then
            name="${name}-$(date +%s)"
            echo -e "${BLUE}Installing as unique name: $name${NC}"
        fi
    fi

    # Perform installation
    $INSTALL_CMD "$(pwd)/skill" "$platform_path/$name"
    echo -e "${GREEN}Successfully installed '$name' to $platform_path${NC}"
}

# Execute installation based on selections
for agent in "${SELECTED_AGENTS[@]}"; do
    case $agent in
        "Claude Code")
            # Added .agents and .agent support
            GLOBAL_PATHS=("$HOME/.claude/skills" "$HOME/.agents" "$HOME/.agent")
            PROJECT_PATHS=(".claude/skills" ".agents" ".agent")
            ;;
        "GitHub Copilot CLI")
            GLOBAL_PATHS=("$HOME/.copilot/skills" "$HOME/.agents")
            PROJECT_PATHS=(".github/skills" ".agents")
            ;;
        "Codex")
            GLOBAL_PATHS=("$HOME/.codex/skills" "$HOME/.agents")
            PROJECT_PATHS=(".codex/skills" ".agents")
            ;;
        *)
            echo -e "${YELLOW}Standard paths for $agent may vary.${NC}"
            GLOBAL_PATHS=("$HOME/.agents" "$HOME/.agent")
            PROJECT_PATHS=(".agents" ".agent")
            ;;
    esac

    if [[ "$SCOPE_CHOICE" == "1" ]]; then
        for path in "${GLOBAL_PATHS[@]}"; do
            install_skill "$path" "$SKILL_NAME"
        done
    else
        for path in "${PROJECT_PATHS[@]}"; do
            install_skill "$path" "$SKILL_NAME"
        done
    fi
done

echo -e "\n${GREEN}Installation Complete! 🎉${NC}"
echo -e "Note: Your existing skills in these folders have been preserved."
