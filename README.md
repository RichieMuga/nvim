# nvim Configuration

## Motivation
Using VSCode was causing memory issues on my system, and it often became sluggish and unresponsive, especially when working with larger codebases or running multiple instances of the editor. This motivated me to explore more lightweight and efficient alternatives, and I discovered the power and flexibility of Neovim (nvim), a modern and highly extensible modal text editor.

## Installation instructions

### Installation
#### Prerequisites

* Neovim (version 0.8 or later)
* Linux Distro or look for how to configure nvim on [mac](https://medium.com/@agaro1121/neovim-config-from-scratch-on-osx-f6639a6a8584)

#### Steps

1. Clone the repository:
```
git@github.com:RichieMuga/nvim.git
```
2. Open your Neovim configuration directory:
```
cd ~/.config/nvim
```
3. Create a symbolic link to the cloned repository:
```
ln -s /.config/nvim
```
5. Start Neovim and run the following command in command mode in nvum to install the plugins:
```
:Lazy install
```

NB: Remember to install Nerd font to the terminal.
Instructions are:

Install Nerd Fonts:
Nerd Fonts are a popular font collection that includes many glyphs and icons used by various plugins in Neovim. To install Nerd Fonts on your Linux machine, follow these steps:
1. Visit the [NerdFont Website](https://www.nerdfonts.com/font-downloads)
2. Download the font of your choice
3. unzip NerdFonts.zip
4. Copy the downloaded `.otf` or `.ttf` files to system fonts directory
  
6. Copy the downloaded `.otf` or `.ttf` files to system fonts directory
  ```
    sudo cp *.otf /usr/share/fonts/
  ```
7. After copying fonts, refresh the system's font cache with the following command
  ```
    sudo fc-cache -fv
  ```
8. Configure your terminal emulator to use the installed Nerd Font:

For Gnome Terminal:
  
  * Open the Terminal preferences (Edit > Preferences)
  * Navigate to the Profiles tab
  * Select the profile you want to modify
  * Click on the Custom Font button
  * Select the installed Nerd Font from the list


For other terminal emulators, refer to their respective documentation for instructions on how to change the font.


## Usage
After following the installation steps, you can start using the configured Neovim setup. The configuration includes various plugins and customizations to enhance your coding experience.

Here is a cheetsheet of the bindings in the nvim configaration
### Git stuff
Located in plugins/git-stuff.lua
* ``` <leader>gp ``` go to previous hunk in ``` Normal mode ```
* ``` <leader>gt ``` toggle current line blame in ``` Normal mode ```

### Lsp lua
Located in plugins/lsp.lua
* ``` <leader>gd ``` go to defenition in ``` Normal mode ```
* ``` <leader>gr ``` refrences in ``` Normal mode ```
* ``` <leader>ca ``` code actions in ``` Normal mode ```

### None ls
Loacated in plugins/none-ls.lua
``` <leader>gf ``` format code in ``` Normal mode ```

### Completions
Loacated in plugins/completions.lua
* ``` <C-b> ``` scroll docs -4 in ``` Normal mode ```
* ``` <C-f> ``` scroll docs 4 in ``` Normal mode ```
* ``` <C-leader> ``` complete in ``` Normal mode ```
* ``` <C-e> ```  abort in ``` Normal mode ```
* ``` <C-R> ``` confitm in ``` Normal mode ```

### Undo Telescope tree
Located in plugins/undo-toggle.lua
* ``` <leader>ut ``` undo tree toggle in ``` Normal mode ```

### Take screenshots with carbon
* ``` z ``` take screenshots in ``` Visual mode ```

###  Neotree
* ``` <C-n> ```, Neotree filesystem reveal left in ```normal mode```
* ```<leader>bf```, Neotree buffers reveal float in ```normal mode```


## Conclusion
Hope you enjoy nvim as much as me. Goodluck!
