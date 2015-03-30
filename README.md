# vim-scripts
Various scripts to easily set up a VIM development environment

It installs by default the following packages:
* [vim-pathogen] - runtime plugin installer
* [ctrlp] - full path fuzzy file, mru, buffer, tag.. finder
* [gundo] - visualize undo tree
* [airline] - light status/tabline
* [nerdtree] - filesystem explorer

Also supports installing [OmniSharp] support for C# development. More information can be found [on my blog]. 

### Installation

Run
```sh
./setup.sh --csharp
```
to set up [omnisharp-server] version or 
```sh
./setup.sh --csharp --roslyn
```
to set up [omnisharp-roslyn] version. 

[vim-pathogen]:https://github.com/tpope/vim-pathogen
[ctrlp]:https://github.com/kien/ctrlp.vim
[gundo]:https://github.com/sjl/gundo.vim
[airline]:https://github.com/bling/vim-airline
[nerdtree]:https://github.com/scrooloose/nerdtree
[on my blog]:http://xplatform-dotnet-dev.blogspot.com/2015/03/caspnet-with-vim-and-omnisharp.html?view=classic
[omnisharp-server]:https://github.com/OmniSharp/omnisharp-server
[omnisharp-roslyn]:https://github.com/OmniSharp/omnisharp-roslyn

### Screenshots

![OmniSharp autocomplete](http://4.bp.blogspot.com/-eDzNnFejghw/VReO8S06SOI/AAAAAAAARgo/1njfKJVLP7E/s1600/Screen%2BShot%2B2015-03-28%2Bat%2B10.33.46%2BPM.png)

