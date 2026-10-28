FROM gentoo/stage3:latest

LABEL org.opencontainers.image.source="https://github.com/emslop/gentoo-ci"
LABEL org.opencontainers.image.description="Gentoo stage3 with git, gh, jq, pkgdev, pkgcheck and a synced Portage tree"

RUN emerge-webrsync \
 && emerge --quiet --usepkg --getbinpkg \
      dev-vcs/git \
      dev-util/github-cli \
      app-misc/jq \
      dev-util/pkgdev \
      dev-util/pkgcheck \
 && rm -rf /var/cache/distfiles/* /var/cache/binpkgs/* /var/tmp/portage/*
