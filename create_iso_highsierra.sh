#!/usr/bin/env bash

# Bail at first High Sierra ISO creation error
set -e

hdiutil create -o ~/Desktop/HighSierra.cdr -size 7316m -layout SPUD -fs HFS+J

hdiutil attach ~/Desktop/HighSierra.cdr.dmg -noverify -mountpoint /Volumes/install_build

sudo /Applications/Install\ macOS\ High\ Sierra.app/Contents/Resources/createinstallmedia --volume /Volumes/install_build --nointeraction

hdiutil detach "/Volumes/Install macOS High Sierra"

hdiutil convert ~/Desktop/HighSierra.cdr.dmg -format UDTO -o ~/Desktop/HighSierra.iso

mv ~/Desktop/HighSierra.iso.cdr ~/Desktop/HighSierra.iso

rm ~/Desktop/HighSierra.cdr.dmg
