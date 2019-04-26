## VIM profile

To install it on any pc link your vimrc to your root path:

	ln -s ~/.vim/.vimrc ~/.vimrc

After this, open vim and run:

	:PluginInstall

Exit vim and compile the autocomplete package [youcompleteme](https://vimawesome.com/plugin/youcompleteme) :
(required packages: *cmake gcc-c++ make python3-devel*)

	cd ~/.vim/bundle/youcompleteme
	./install.py --clang-completer
