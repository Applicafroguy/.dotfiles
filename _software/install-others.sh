#!/bin/bash

# startship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# nerd font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
unzip FiraMono.zip
font-manager -i *.otf
rm *.otf
rm FiraMono.zip


