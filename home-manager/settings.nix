{ username, stateVersion }:
{
  home = {
    stateVersion = "${stateVersion}";
    username = "${username}";
    homeDirectory = "/home/${username}";
  };
}