install:
		pkg install x11-repo root-repo
		pkg install -y `cat pkglist`
		pkg upgrade -y
		[ ! -d "${HOME}/powerlevel10k" ] && \
			git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${HOME}/powerlevel10k && \
			echo 'source ${HOME}/powerlevel10k/powerlevel10k.zsh-theme' >> ${HOME}/.zshrc || echo "Not cloning powerlevel10k repository again"
		install -Dm 644 ".config/bash_aliases.sh" "${PREFIX}/etc/profile.d/bash_aliases.sh"
		install -Dm 644 ".config/guictl.sh" "${PREFIX}/etc/profile.d/guictl.sh"

		[ -f "${HOME}/.zshrc" ] && echo "source ${PREFIX}/etc/profile" >> "${HOME}/.zshrc" || echo "Error"
		chsh -s zsh
uninstall:
		apt purge --autoremove -y `cat pkglist`
		if [ -f "${PREFIX}/etc/profile.d/bash_aliases.sh" ]; then rm "${PREFIX}/etc/profile.d/bash_aliases.sh"; fi
		if [ -d "${PREFIX}/etc/profile.d/guictl.sh" ]; then rm "${PREFIX}/etc/profile.d/guictl.sh"; fi
