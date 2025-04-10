#!/bin/bash

echo "🔧 Installing Homebrew packages: wget, curl, git, tmux, zsh, unzip, fontconfig..."

# Install Homebrew if not already installed
if ! command -v brew &>/dev/null; then
    echo "🍺 Homebrew not found. Installing Homebrew..."
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
    echo "✅ Homebrew already installed."
fi

# Install packages via Homebrew
brew install wget curl git tmux zsh unzip fontconfig

echo "🔤 Installing Hack Nerd Font to support icons..."
brew tap homebrew/cask-fonts
brew install --cask font-hack-nerd-font

# Set font in Terminal (manual step for macOS, you can mention this to the user)
echo "⚠️ Please set 'Hack Nerd Font Mono' manually in your terminal profile settings (iTerm2 or Terminal.app)."

TMUX_CONF_URL="https://raw.githubusercontent.com/theizekry/tmux/refs/heads/main/.tmux.conf"
TMUX_CONF_PATH="$HOME/.tmux.conf"
TPM_PATH="$HOME/.tmux/plugins/tpm"

echo "📥 Downloading tmux.conf..."
curl -fsSL "$TMUX_CONF_URL" -o "$TMUX_CONF_PATH"

# Install TPM if not present
if [ ! -d "$TPM_PATH" ]; then
    echo "🔧 Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_PATH"
else
    echo "✅ TPM is already installed."
fi

# Function to safely add alias to ~/.zshrc if missing
add_alias_if_missing() {
    local alias_cmd=$1
    if ! grep -qxF "$alias_cmd" "$HOME/.zshrc"; then
        echo "$alias_cmd" >> "$HOME/.zshrc"
        echo "✅ Added alias to ~/.zshrc: $alias_cmd"
    else
        echo "⚠️ Alias already exists in ~/.zshrc: $alias_cmd"
    fi
}

add_alias_if_missing 'alias tmuxsource="tmux source-file ~/.tmux.conf"'
add_alias_if_missing 'alias tmuxconfig="nano ~/.tmux.conf"'

# Source config if already in tmux
if [ -n "$TMUX" ]; then
    echo "🔄 Inside Tmux: Sourcing the config..."
    tmux source-file "$TMUX_CONF_PATH"

    echo "📦 Installing Tmux plugins via TPM..."
    "$TPM_PATH/bin/install_plugins"
else
    echo "⚠️ Not inside Tmux! Start Tmux and run: tmuxsource"
fi

echo "✅ Tmux setup complete! Use 'tmuxsource' to reload config and 'tmuxconfig' to edit it."
