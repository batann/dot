# SpaceVim Cheatsheet

## **General Settings**
- **Enable Mouse Support**: `set -g mouse on`
- **Clipboard Integration**: `set -g set-clipboard external`
- **Pane Colors**:
  - Active Pane: `set -g display-panes-active-colour colour3`
  - Inactive Pane: `set -g display-panes-colour colour4`
- **Terminal Settings**:
  - Default Terminal: `set -g default-terminal "screen-256color"`
  - History Limit: `set -g history-limit 20000`
  - Buffer Limit: `set -g buffer-limit 20`
  - Escape Time: `set -sg escape-time 0`
  - Display Time: `set -g display-time 1500`
  - Remain on Exit: `set -g remain-on-exit off`
  - Repeat Time: `set -g repeat-time 300`
- **Window Settings**:
  - Allow Rename: `setw -g allow-rename off`
  - Automatic Rename: `setw -g automatic-rename off`
  - Aggressive Resize: `setw -g aggressive-resize on`

## **Key Bindings**
- **Prefix Key**: `set -g prefix C-a` (unbind `C-b`)
- **Edit Configuration**: `bind C-e new-window -n 'tmux.conf' "sh -c '\${EDITOR:-vim} ~/.tmux.conf && tmux source ~/.tmux.conf && tmux display \"Config reloaded\"'"`
- **Reload Configuration**: `bind C-r source-file ~/.tmux.conf \; display "Config reloaded"`
- **New Window**: `bind c new-window -c "#{pane_current_path}"`
- **Rename Window**: `bind r command-prompt -I "#{window_name}" "rename-window '%%'"`
- **Rename Session**: `bind R command-prompt -I "#{session_name}" "rename-session '%%'"`
- **Split Panes**:
  - Horizontal: `bind | split-window -h -c "#{pane_current_path}"`
  - Vertical: `bind _ split-window -v -c "#{pane_current_path}"`
- **Select Pane/Window**:
  - Previous Window: `bind -r C-[ previous-window`
  - Next Window: `bind -r C-] next-window`
  - Previous Pane: `bind -r [ select-pane -t :.-`
  - Next Pane: `bind -r ] select-pane -t :.`
  - Last Window: `bind -r Tab last-window`
  - Swap Pane: `bind -r C-o swap-pane -D`
- **Zoom Pane**: `bind + resize-pane -Z`
- **Link Window**: `bind L command-prompt -p "Link window from (session:window): " "link-window -s %% -a"`
- **Kill Pane/Window/Session**:
  - Kill Pane: `bind x kill-pane`
  - Kill Window: `bind X kill-window`
  - Kill Other Windows: `bind C-x confirm-before -p "kill other windows? (y/n)" "kill-window -a"`
  - Kill Session: `bind Q confirm-before -p "kill-session #S? (y/n)" kill-session`
- **Detach from Session**: `bind d detach`
- **Detach Other Clients**: `bind D if -F '#{session_many_attached}' 'confirm-before -p "Detach other clients? (y/n)" "detach -a"' 'display "Session has only 1 client attached"'`
- **Toggle Status Bar**: `bind C-s if -F '#{s/off//:status}' 'set status off' 'set status on'`

## **Highlights and Colors**
- **Active Pane Color**: `colour3`
- **Inactive Pane Color**: `colour4`
- **Status Line**: `set -g status-bg colour2`

---

