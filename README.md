
# Tmux Auto-Setup Script
### This script sets up Tmux with enhanced usability, improved navigation, and useful plugins for an optimized workflow.

#### Tmux is a terminal multiplexer that lets you manage multiple terminal sessions in one window.  
You can split windows into panes, detach and reattach sessions, and keep workflows running even after closing your terminal—making it a great tool for developers and system administrators.

📖 Learn more about Tmux: [Tmux GitHub](https://github.com/tmux/tmux) | [Official Documentation](https://man7.org/linux/man-pages/man1/tmux.1.html)

This script enhances your Tmux setup with better usability, smoother navigation, and powerful plugins.  
It builds on your current configuration, making Tmux more customizable and efficient.

It also includes [Tmux Plugin Manager (TPM)](https://github.com/tmux-plugins/tpm), which makes installing and managing Tmux plugins effortless.

📖 Learn more about TPM: [Tmux Plugin Manager (TPM) GitHub](https://github.com/tmux-plugins/tpm)

--------------------------------------------------------------------------------

## Installation & Usage
```
wget -qO-  https://raw.githubusercontent.com/theizekry/tmux/main/tmux.install.sh  | bash
```

## If you're a Mac user use this instead
```
wget -qO-  https://raw.githubusercontent.com/theizekry/tmux/main/tmux.install.mac.sh  | bash
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

