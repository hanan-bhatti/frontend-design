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

# Detect if we are running remotely or locally
REPO_URL="https://github.com/hanan-bhatti/frontend-design.git"
TEMP_DIR="/tmp/frontend-design-install-$(date +%s)"

if [[ ! -d "./skill" ]]; then
    echo -e "${YELLOW}Skill folder not found. Downloading repository to temporary folder...${NC}"
    if ! command -v git &> /dev/null; then
        echo -e "${RED}Error: git is not installed. Please install git first.${NC}"
        exit 1
    fi
    git clone --depth 1 "$REPO_URL" "$TEMP_DIR" &> /dev/null
    cd "$TEMP_DIR" || exit 1
fi

# 1. Select Agents (Top AI Agents)
echo -e "\n${YELLOW}Step 1: Select your AI Agents (Space to select, Enter to confirm)${NC}"
AGENTS=("Claude Code" "GitHub Copilot CLI" "Codex" "Cursor" "Windsurf" "Aider" "Continue" "Supermaven")
SELECTED_AGENTS=()

for i in "${!AGENTS[@]}"; do
    echo "$((i+1))) ${AGENTS[$i]}"
done

# Read from /dev/tty to avoid consuming the script when piped
printf "Enter numbers separated by space (e.g., 1 2): "
read -r choices < /dev/tty

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
printf "Selection (1/2): "
read -r LINK_TYPE_CHOICE < /dev/tty

INSTALL_CMD="ln -sf"
[[ "$LINK_TYPE_CHOICE" == "2" ]] && INSTALL_CMD="cp -r"

# 3. Select Scope
echo -e "\n${YELLOW}Step 3: Select Scope${NC}"
echo "1) Global (Available for all projects)"
echo "2) Project (Local to this directory only)"
printf "Selection (1/2): "
read -r SCOPE_CHOICE < /dev/tty

# 4. Define Skill Name
DEFAULT_NAME="frontend-design-master"
echo -e "\n${YELLOW}Step 4: Naming${NC}"
printf "Enter skill name [$DEFAULT_NAME]: "
read -r SKILL_NAME < /dev/tty
SKILL_NAME=${SKILL_NAME:-$DEFAULT_NAME}

# Function to perform installation
install_skill() {
    local platform_path=$1
    local name=$2
    local source_path="$(pwd)/skill"
    
    # Handle Global vs Project Path Expansion
    if [[ "$platform_path" == /* ]]; then
        # Global path - ensure it's absolute
        dest_parent="$platform_path"
    else
        # Project path - relative to where the command was run
        # If we are in a temp dir, project scope must be relative to the ORIGINAL directory
        if [[ -d "$TEMP_DIR" ]]; then
            dest_parent="$OLDPWD/$platform_path"
        else
            dest_parent="$platform_path"
        fi
    fi

    mkdir -p "$dest_parent"

    if [[ -d "$dest_parent/$name" ]] || [[ -L "$dest_parent/$name" ]]; then
        echo -e "${YELLOW}Notice: '$name' already exists in $dest_parent${NC}"
        printf "Overwrite existing? (y/n) [n]: "
        read -r do_overwrite < /dev/tty
        if [[ "$do_overwrite" != "y" ]]; then
            name="${name}-$(date +%s)"
            echo -e "${BLUE}Installing as unique name: $name${NC}"
        else
            rm -rf "$dest_parent/$name"
        fi
    fi

    $INSTALL_CMD "$source_path" "$dest_parent/$name"
    echo -e "${GREEN}Successfully installed '$name' to $dest_parent${NC}"
}

# Execute installation
for agent in "${SELECTED_AGENTS[@]}"; do
    case $agent in
        "Claude Code")
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

# Cleanup if we cloned to a temp dir
if [[ -d "$TEMP_DIR" ]]; then
    echo -e "\n${YELLOW}Cleaning up temporary files...${NC}"
    rm -rf "$TEMP_DIR"
fi

echo -e "\n${GREEN}Installation Complete! 🎉${NC}"
echo -e "You can now use the skill in your selected AI agents."
