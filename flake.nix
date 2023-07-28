{
  description = "Personal dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    hyprland.url = "github:hyprwm/Hyprland";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, nixpkgs-unstable, nix-index-database, hyprland
    , home-manager, ... }:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      pkgs-unstable = import nixpkgs-unstable {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        art = lib.nixosSystem {
          inherit system;
          modules = [
            hyprland.nixosModules.default
            { programs.hyprland.enable = true; }
            ./system/configuration.nix
          ];
          specialArgs = { inherit pkgs-unstable; };
        };
      };
      artHm = {
        matNixos = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/home.nix ];
          extraSpecialArgs = { inherit pkgs-unstable; };
        };
        matFedora = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            # hyprland.homeManagerModules.default
            # {
            #   wayland.windowManager.hyprland = {
            #     enable = true;
            #     extraConfig = ''
            #       source = ~/.config/hypr/hyprmat.conf
            #     '';
            #   };
            # }
            ./home/fedora/home.nix
          ];
          extraSpecialArgs = { inherit pkgs-unstable; };
        };
        matArch = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/arch/home.nix nix-index-database.hmModules.nix-index];
          extraSpecialArgs = { inherit pkgs-unstable; };
        };
        matMint = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/mint/home.nix nix-index-database.hmModules.nix-index];
          extraSpecialArgs = { inherit pkgs-unstable; };
        };
      };
    };
}
