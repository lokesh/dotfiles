- Show hidden files in Finder: <kbd>cmd</kbd> + <kbd>shift</kbd> + <kbd>.</kbd>

## Code editor
- Install [VSCode](https://code.visualstudio.com/) code editor.
  - Login with Github to port settings
  - Install shell command

## Terminal
MacOS uses zsh shell by default. Confirm with `echo $0`.

- Install [Oh My ZSH](https://ohmyz.sh/) which helps with customization (e.g. adds theme support). It will create/overwrite your `.zshrc` file.
  - Switch themes by updating the config file: `ZSH_THEME="af-magic"`

Configutation files:
- .zprofile
  - loads .profile
  - loads .zshrc

## Node
- Install [nvm](https://github.com/nvm-sh/nvm)
- Install node through nvm: `nvm install node`

## Github
- Set up git username/email
  - `git config --global user.name "Lokesh Dhakar"`
  - `git config --global user.email "lokesh.dhakar@gmail.com"`

- Run `generate_ssh_keys.sh`.
- (Optional) Run `clone_github_repos.sh` to clone all your Github repos and put them in `~/Projects/`.

## MacOS apps
- Install **Xcode** and agree to license
- **Rectangle** for Window mgmt. Shortcuts to full screen, 50/50, 1/3, 2/3, et al. Previously used Spectacles, but it is no longer maintained.
- **Lunar** for managing multi-monitor brightness. Set up left-half, right half, max, and centering shortcuts, and enable cycling sizes so repeating the left and right half shortcuts will move between 1/3, 1/2, and 2/3.
- **Eagle** for collecting inspiration (images and video).
