{
  description = "axyie's darwin system";
  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    darwin = {
      url = "github:lnl7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { self, nixpkgs, home-manager, darwin }@inputs:
    let
      hosts = {
        x86_64-darwin = [ "astronomy" ];
      };
      forAll = t: m: map (h: { "${h}" = m t h; }) hosts.${t};
      configure = l: nixpkgs.lib.attrsets.mergeAttrsList l;
      configureDarwin = t: m: configure (forAll t m);
    in
    {
      darwinConfigurations = configureDarwin "x86_64-darwin" (target: host:
        darwin.lib.darwinSystem {
          system = "${target}";
          modules = [
            home-manager.darwinModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
              nixpkgs.config.allowUnfree = true;
            }
            (./hosts + "/${target}:${host}")
            (./hosts + "/${target}:${host}/fonts.nix")
            (./hosts + "/${target}:${host}/homebrew.nix")
            (./hosts + "/${target}:${host}/yabai.nix")
          ];
          specialArgs = { inherit inputs; };
        });
    };
}
