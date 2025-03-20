
# Tmux Auto-Setup Script
### This script sets up Tmux with enhanced usability, improved navigation, and useful plugins for an optimized workflow.

## Installation & Usage
```
wget -q -O tmux.install.sh https://raw.githubusercontent.com/theizekry/tmux/main/tmux.install.sh
chmod +x tmux.install.sh
./tmux.install.sh
```

Run the following commands to apply the configuration:

This will:👉 Apply Tmux configurations👉 Set up Tmux Plugin Manager (TPM)

Key Bindings & Customizations

Reload Configuration

Reload Tmux configuration using Prefix + r (default: Ctrl + A, r)

- Change Prefix to Ctrl + A (Instead of Ctrl + B)

- Enable Mouse Support

- Allows selecting and resizing panes using the mouse.

- Better Pane Navigation

- Status Bar Customization

- Sets a black background with green text.

## Plugins

This configuration includes powerful plugins to improve Tmux usability.

- Auto-Restore Sessions on Startup

- Prefix Key Highlight

- Displays an indicator in the status bar when the prefix key (Ctrl + A) is active.

⚡ Applying Changes

After installation, start Tmux and load the new configuration:

Inside Tmux, install plugins with: Ctrl + A then I

To reload the configuration:

