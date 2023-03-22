{
  description = "Personal dotfiles";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-22.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager }@inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
      lib = nixpkgs.lib;
    in {
      nixosConfigurations = {
        art = lib.nixosSystem {
          inherit system;
          modules = [ ./system/configuration.nix ];
        };
      };
      artHm = {
        mat = home-manager.lib.homeManagerConfiguration {
          inherit pkgs;
          modules = [
            {
              home = {
                username = "mat";
                homeDirectory = "/home/mat";
                stateVersion = "22.11";
              };
            }
            ./home/home.nix
          ];
        };
      };
    };
}
