## General Settings

    Prefix Key: C-a (Change prefix key)
    Status Bar: Enabled (toggle with C-s)

## Window Management

    New Window: c (current path), new-window -n 'tmux.conf' (edit config & reload)
    Rename Window: r (current window), R (current session)
    Split Window:
        Horizontal: | (current path)
        Vertical: _ (current path)
    Select Window:
        Previous: C-[
        Next: C-]
        Last: Tab
    Swap Panes:
        Back and forth with 1st pane: C-o
    Close Pane/Window/Session:
        Pane: x
        Window: X
        Session (confirm): C-x
    Detach from Session:
        Detach: d
        Detach all clients (confirm): D

## Window Monitoring

    Monitor Window Activity: m (toggle)
    Monitor Window Silence (prompt for interval): M

## Copy Mode

    Enter Copy Mode: M-Up
    Scroll Up/Down:
        Line: M-Up / M-Down
        Half Screen: M-PageUp / M-PageDown
        Full Screen: PageUp / PageDown
    Copy Selected Text:
        Enter: Enter
        Yank: y
        Copy Line: Y
        Copy to End of Line: C-j
        Append Selection: A

## Themes (These colors can be customized in your tmux.conf file)

    Main: color_orange
    Secondary: color_purple
    Status Text: color_status_text
    Active Pane Outline: color_main

## Plugins

    tmux-battery: Displays battery status
    tmux-prefix-highlight: Highlights prefix key
    tmux-online-status: Shows online/offline status
    tmux-sidebar: Provides a sidebar for navigation
    tmux-copycat: Manages copy buffers
    tmux-open: Opens URLs in browser
    samoshkin/tmux-plugin-sysstat: Displays system stats (CPU, memory, load)

## Nesting Local and Remote Sessions

    Local sessions use the defined prefix key C-a
    Remote sessions (via SSH) disable prefix key and visual styles for nested session compatibility.
