#!/bin/bash

# startship
sh -c "$(curl -fsSL https://starship.rs/install.sh)"

# nerd font
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/FiraMono.zip
unzip FiraMono.zip
font-manager -i *.otf
rm *.otf
rm FiraMono.zip

# conda
wget https://repo.anaconda.com/miniconda/Miniconda3-py39_4.10.3-Linux-x86_64.sh
bash Miniconda3-py39_4.10.3-Linux-x86_64.sh
rm Miniconda3-py39_4.10.3-Linux-x86_64.sh

# radian
pip install radian


