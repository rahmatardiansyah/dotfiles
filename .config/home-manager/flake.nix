{
  description = "Personal Dotfiles Menage Using Nix Home Manager";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";
    nix-index-database.url = "github:Mic92/nix-index-database";
    nix-index-database.inputs.nixpkgs.follows = "nixpkgs";
    home-manager = {
      url = "github:nix-community/home-manager/release-23.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs =
    { nixpkgs, nixpkgs-unstable, nix-index-database, home-manager, ... }:
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
        nixos = lib.nixosSystem {
          inherit system;
          specialArgs = { inherit pkgs-unstable; };
          modules = [ ./system/configuration.nix ];
        };
      };
      artHome = {
        mat = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [ ./home/home.nix ];
          extraSpecialArgs = { inherit pkgs-unstable; };
        };
        rahmatWsl = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules =
            [ ./home/wsl/home.nix nix-index-database.hmModules.nix-index ];
          extraSpecialArgs = { inherit pkgs-unstable; };
        };
      };

    };
}
