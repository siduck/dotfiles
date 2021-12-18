# DONT SKIP THE README 
# Screenshots (BSPWM)

<img src= "https://i.redd.it/fdpnwmh4e7571.png"> 

# Important Notes For BSPWM 

- Fonts needed : any nerdfont (JetbrainsMono Nerd Font is what I use) and material design icon font

- My bspwm has workspaces named from 1 to 5 , and the polybar bspwm module uses those workspace names only . So if workspace icons dont show for you then add this    in bspwmrc  bspc monitor -d 1 2 3 4 5  . 
- I use [ST](https://github.com/siduck/st)  as terminal with JetbrainsMono Nerd Font medium.
- Music player : ncmpcpp with mpd ( ncmpcpp-ueberzug to show artwork) , configs in cli_tools folder. you need to chmod +x its scripts in ncmcpp-ueberzug and ffmpeg , mpc is needed to show albumn art and check the .bashrc for important aliases. 
- [neovim config](https://github.com/NvChad/nvchad) + rename nvim folder as custom and move it to ~/.config/nvim/lua if you've installed nvchad.

- gtk theme : my own ,based on onedark (in the gtk folder )
- There is one module in polybar called "updates" , its distro specifc and would work for void only so please remove it or it will crash polybar! run polybar example to fix errors if there are any.
- change some values in polybar like in wlan , battery module for your wifi adapter etc , run polybar example to find out any erorrs if polybar isnt working. Also polybar takes colors from xresources file so first load xresources then run polybar.

I'll keep adding cool stuffs and improve my rice / make it more organise in my free time eventually :)

# Fluxbox

<img src="https://chadpaste.com/f/frjdliwmwr.png">

[config](https://github.com/siduck/dotfiles/tree/fluxbox)

# Openbox

<img src= "https://camo.githubusercontent.com/e38c94c73ca29f449416f390a9a1737f755339ef86745fb4e1de7dd2cb1a2227/68747470733a2f2f63646e2e646973636f72646170702e636f6d2f6174746163686d656e74732f3633343030353632303232333337373431382f3838393732393239393232343037363238382f756e6b6e6f776e2e706e67"> 

[config](https://github.com/siduck/dotfiles/tree/openbox)

Credits : [Stardust-kyun](https://github.com/Stardust-kyun/dotfiles) I used his tint2 config and openbox window theme as a base and modified em!

NOTE : gimmie credits if you're using my rice! no kangg pls :c 
