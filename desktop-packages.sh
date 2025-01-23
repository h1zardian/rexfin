#!/bin/bash

set -ouex pipefail

dnf5 -y config-manager --disable copr:copr.fedorainfracloud.org:phracek:PyCharm
dnf5 -y config-manager --disable google-chrome
dnf5 -y config-manager --disable rpmfusion-nonfree-nvidia-driver
dnf5 -y config-manager --disable rpmfusion-nonfree-steam

dnf5 -y config-manager --enable code
dnf5 -y config-manager --enable rpmfusion-free-release
dnf5 -y config-manager --enable rpmfusion-nonfree-release

dnf5 -y copr enable peterwu/rendezvous


EXCLUDE_PACKAGES=(
    ffmpeg-free
    mesa-va-drivers
    mesa-vdpau-drivers
)

INCLUDE_PACKAGES=(
    code
    bibata-cursor-themes
    papirus-icon-theme
    gnome-themes-extra
    ffmpeg
    alsa-ucm
    alsa-utils
    gstreamer1-plugin-libav
    gstreamer1-plugin-openh264
    gstreamer1-plugins-bad-free
    gstreamer1-plugins-good
    gstreamer1-plugins-ugly-free
    pipewire-alsa
    pipewire-gstreamer
    pipewire-pulseaudio
    pipewire-utils
    wireplumber
	gstreamer1-plugins-bad-free-extras
	gstreamer1-plugins-bad-freeworld
	gstreamer1-plugins-ugly
	gstreamer1-vaap
    mesa-va-drivers-freeworld
    mesa-vdpau-drivers-freeworld
)

dnf5 install --setopt=install_weak_deps=False -y "${INCLUDE_PACKAGES[@]}"