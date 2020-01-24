# mindtree vim config

Custom configuration for git.

### Contains

- `./vim/vimrc` as main config file.
- `./bundle` containing pathogen plugins.
- `./colors` custom colour schemes.

### New machine setup

```
cd ~
git clone http://github.com/mitchmindtree/dotvim.git ~/.vim
cd ~/.vim
git submodule init
git submodule update
```

### Adding plugins as submodules

```
cd ~/.vim
git submodule add https://github.com/user/plugin bundle/plugin
git add .
git commit -m "Added plugin as a submodule."
```

### Upgrade individual plugins

`cd` in and pull/fetch as normal.

### Upgrading all plugins

```bash
git submodule foreach git pull origin master
```

### Links

The above followed via this guide:

http://vimcasts.org/episodes/synchronizing-plugins-with-git-submodules-and-pathogen/
