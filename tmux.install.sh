#!/bin/bash

TMUX_CONF_URL="https://raw.githubusercontent.com/theizekry/tmux/refs/heads/main/.tmux.conf"

# Define tmux config path
TMUX_CONF_PATH="$HOME/.tmux.conf"

# Define TPM path
TPM_PATH="$HOME/.tmux/plugins/tpm"

# Download .tmux.conf
echo "📥 Downloading tmux.conf..."
wget -q -O "$TMUX_CONF_PATH" "$TMUX_CONF_URL"

# Ensure TPM (Tmux Plugin Manager) is installed
if [ ! -d "$TPM_PATH" ]; then
    echo "🔧 Installing TPM (Tmux Plugin Manager)..."
    git clone https://github.com/tmux-plugins/tpm "$TPM_PATH"
else
    echo "✅ TPM is already installed."
fi

# Function to add aliases to ~/.zshrc only if they don't exist
add_alias_if_missing() {
    local alias_cmd=$1
    if ! grep -qxF "$alias_cmd" "$HOME/.zshrc"; then
        echo "$alias_cmd" >> "$HOME/.zshrc"
        echo "✅ Added alias to ~/.zshrc: $alias_cmd"
    else
        echo "⚠️ Alias already exists in ~/.zshrc: $alias_cmd"
    fi
}

# Add aliases to ~/.zshrc only if they are missing
add_alias_if_missing 'alias tmuxsource="tmux source-file ~/.tmux.conf"'
add_alias_if_missing 'alias tmuxconfig="nano ~/.tmux.conf"'

# Source the new config
# Check if inside a Tmux session
if [ -n "$TMUX" ]; then
    echo "🔄 Inside Tmux: Sourcing the config..."
    tmux source-file "$TMUX_CONF_PATH"

    # Install plugins using TPM inside Tmux
    echo "📦 Installing Tmux plugins..."
    "$TPM_PATH/bin/install_plugins"
else
    echo "⚠️ Not inside Tmux! Start Tmux and run: tmux-source"
fi

echo "✅ Tmux setup complete! Use 'tmux-source' to reload config and 'tmux-edit' to edit it."
