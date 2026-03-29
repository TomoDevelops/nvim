# Keymaps

Leader: `Space`

## General

| Key | Mode | Action |
|-----|------|--------|
| `<leader>w` | n | Save file |
| `<leader>x` | n | Close buffer |
| `<Esc>` | n | Clear search highlight |
| `<C-h/j/k/l>` | n | Navigate windows |
| `<C-d>` | n | Half-page down (centered) |
| `<C-u>` | n | Half-page up (centered) |
| `n` / `N` | n | Next/prev search match (centered) |
| `J` / `K` | v | Move selection down/up |
| `<leader>p` | x | Paste without overwriting register |

## Terminal

| Key | Mode | Action |
|-----|------|--------|
| `<leader>cc` | n | Toggle Claude terminal |
| `<C-\><C-\>` | t | Exit terminal mode |

## Telescope (fuzzy finder)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pf` | n | Find files |
| `<leader>ff` | n | Find files |
| `<leader>ps` | n | Live grep (search file contents) |
| `<leader>fb` | n | Find buffers |
| `<leader>fh` | n | Help tags |
| `<leader>ft` | n | Find TODOs |
| `<C-n>` / `<C-p>` | i (telescope) | Move selection down/up |
| `<C-d>` | i (telescope) | Delete buffer |
| `dd` | n (telescope) | Delete buffer |

## File Explorer

| Key | Mode | Action |
|-----|------|--------|
| `<leader>pv` | n | Toggle file explorer |

## Harpoon (bookmarks)

| Key | Mode | Action |
|-----|------|--------|
| `<leader>a` | n | Add file to bookmarks |
| `<leader>e` | n | Open bookmarks menu |
| `<C-j>` | n | Previous bookmark |
| `<C-k>` | n | Next bookmark |

## Git

| Key | Mode | Action |
|-----|------|--------|
| `<leader>gs` | n | Git status (fugitive) |
| `<leader>gb` | n | Git blame |
| `<leader>gp` | n | Git push |
| `<leader>gu` | n | Git push (set upstream) |
| `<leader>gd` | n | Diff view (all files) |
| `<leader>gh` | n | Current file git history |
| `<leader>gq` | n | Close diff view |

### Inside fugitive (`<leader>gs`)

| Key | Action |
|-----|--------|
| `-` | Toggle stage/unstage file |
| `X` | Discard changes for file |
| `cc` | Commit |
| `=` | Toggle inline diff |
| `dv` | Diff file in vertical split |
| `gq` | Close fugitive window |

## LSP

| Key | Mode | Action |
|-----|------|--------|
| `gd` | n | Go to definition |
| `gr` | n | Go to references |
| `K` | n | Hover docs |
| `<leader>ca` | n | Code action |
| `<leader>rn` | n | Rename symbol |
| `<leader>d` | n | Line diagnostics |

## Comment

| Key | Mode | Action |
|-----|------|--------|
| `gcc` | n | Toggle comment line |
| `gc` | v | Toggle comment selection |

## Surround

| Key | Mode | Action |
|-----|------|--------|
| `ysiw"` | n | Surround word with `"` |
| `cs"'` | n | Change surrounding `"` to `'` |
| `ds(` | n | Delete surrounding `()` |
