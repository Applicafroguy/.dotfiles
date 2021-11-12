#!/bin/bash

dconf write /org/gnome/desktop/input-sources/show-all-sources true
dconf write /org/gnome/desktop/input-sources/sources "[('xkb', 'us'), ('xkb', 'eu')]"

