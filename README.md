# DONT SKIP THE README 
# Screenshots (BSPWM)

<img src = "https://raw.githubusercontent.com/siduck/dotfiles/master/rice%20flex/neovim-rice.png">
<img src = "https://cdn.discordapp.com/attachments/610012460828852229/853933487295299584/unknown.png">

# Important Notes For BSPWM 

- The above image is my latest bspwm rice , you'll find out its configs in the thinkpad folder.
- Install all the polybar fonts!
- My bspwm has workspaces named from 1 to 5 , and the polybar bspwm module uses those workspace names only . So if workspace icons dont show for you then add this    in bspwmrc  bspc monitor -d 1 2 3 4 5  . 
- I use [ST](https://github.com/siduck/st)  as terminal with JetbrainsMono Nerd Font medium.
- [wallpaper](https://github.com/siduck/dotfiles/blob/master/wall/sniper.jpg).
- Music player : ncmpcpp with mpd ( ncmpcpp-ueberzug to show artwork) , configs in cli_tools folder. you need to chmod +x its scripts in ncmcpp-ueberzug and ffmpeg , mpc is needed to show albumn art and check the .bashrc for important aliases. 
- Text Editor : neovim nightly , [config](https://github.com/siduck/neovim-dots).
- colorscheme : onedark but darker bg.
- gtk theme : my own based on onedark but darker (in the gtk folder )
- change dpi in the xresources.
- There is one module in polybar called "updates" , its distro specifc and would work for void only so please remove it or it will crash polybar! run polybar example to fix errors if there are any.
- change some values in polybar like in wlan , battery module for your wifi adapter etc , run polybar example to find out any erorrs if polybar isnt working. Also polybar takes colors from xresources file so first load xresources then run polybar.

I'll keep adding cool stuffs and improve my rice / make it more organise in my free time eventually :)

# Fluxbox

<img src="https://chadpaste.com/f/frjdliwmwr.png">

## Important Notes for fluxbox

- [config](https://github.com/siduck/dotfiles/tree/master/stackingWms/fluxbox/.fluxbox)
- [wall](https://raw.githubusercontent.com/siduck/dotfiles/master/wall/clean.png)
- [polybar config](https://github.com/siduck/dotfiles/tree/master/bars/poly/fluxbox)
- check my st repo for the onedark xresources

NOTE : gimmie credits if you're using my rice! no kangg pls :c 
