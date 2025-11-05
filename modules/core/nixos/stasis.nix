{
  self,
  system,
  ...
}:
{
  environment.systemPackages = [ self.inputs.stasis.packages.${system}.stasis ];
}
