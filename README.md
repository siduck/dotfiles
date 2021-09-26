# DONT SKIP THE README 
# Screenshots (BSPWM)

<img src= "https://i.redd.it/fdpnwmh4e7571.png"> 

# Important Notes For BSPWM 

- Fonts needed : any nerdfont (JetbrainsMono Nerd Font is what I use) and material design icon font

- My bspwm has workspaces named from 1 to 5 , and the polybar bspwm module uses those workspace names only . So if workspace icons dont show for you then add this    in bspwmrc  bspc monitor -d 1 2 3 4 5  . 
- I use [ST](https://github.com/siduck76/st)  as terminal with JetbrainsMono Nerd Font medium.
- Music player : ncmpcpp with mpd ( ncmpcpp-ueberzug to show artwork) , configs in cli_tools folder. you need to chmod +x its scripts in ncmcpp-ueberzug and ffmpeg , mpc is needed to show albumn art and check the .bashrc for important aliases. 
- [neovim config](https://github.com/NvChad/nvchad).
- gtk theme : my own ,based on onedark (in the gtk folder )
- There is one module in polybar called "updates" , its distro specifc and would work for void only so please remove it or it will crash polybar! run polybar example to fix errors if there are any.
- change some values in polybar like in wlan , battery module for your wifi adapter etc , run polybar example to find out any erorrs if polybar isnt working. Also polybar takes colors from xresources file so first load xresources then run polybar.

I'll keep adding cool stuffs and improve my rice / make it more organise in my free time eventually :)

# Fluxbox

<img src="https://chadpaste.com/f/frjdliwmwr.png">

[config](https://github.com/siduck76/dotfiles/tree/fluxbox)

# Openbox

<img src= "https://cdn.discordapp.com/attachments/634005620223377418/889729299224076288/unknown.png"> 

[config](https://github.com/siduck76/dotfiles/tree/openbox)

NOTE : gimmie credits if you're using my rice! no kangg pls :c 
