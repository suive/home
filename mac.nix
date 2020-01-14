{ pkgs, ... }:

{
  imports = [ ./common.nix ./emacs.nix ];

  programs.zsh = {
    shellAliases = {
      ls = "ls -hlGa";
    };
    profileExtra = ''
      source $HOME/.profile
      source "$HOME/.nix-profile/etc/profile.d/nix.sh"
      export NIX_PATH=$HOME/.nix-defexpr/channels''${NIX_PATH:+:}$NIX_PATH
    '';
  };

  home.file = {
    ".hushlogin".source = builtins.toFile "hushlogin" "";
  };

}
