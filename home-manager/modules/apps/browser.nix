{
  pkgs,
  lib,
  ...
}: {
  programs.librewolf = {
    enable = true;
    enableGnomeExtensions = true;
    profiles = {
      simonkdev = {
        name = "simonkdev";
        isDefault = true;
        bookmarks = {
          force = true;
          settings = [
            {
              name = "Learn X in Y minutes";
              url = "https://learnxinyminutes.com/";
            }
            {
              name = "quickref.me";
              url = "https://quickref.me/";
            }
            {
              name = "github:simonkdev";
              url = "https://github.com/simonkdev";
            }
            {
              name = "PVE";
              url = "https://192.168.178.100:8006/";
            }
            {
              name = "Nix Concepts";
              url = "https://zero-to-nix.com/concepts/";
            }
            {
              name = "Machine Learning";
              bookmarks = [
                {
                  name = "ML trainings";
                  url = "https://github.com/susilvaalmeida/machine-learning-andrew-ng";
                }
                {
                  name = "ML specialization OptLabs";
                  url = "https://github.com/greyhatguy007/Machine-Learning-Specialization-Coursera";
                }
                {
                  name = "Course Two Andrew Ng";
                  url = "https://www.youtube.com/watch?v=ggWLvh484hs&list=PLyoNSC4BT4eVpykPF0Yx8C1Zs50XtD17L";
                }
                {
                  name = "Unsupervised Learning, Recommenders, Reinforcement Learning";
                  url = "https://www.youtube.com/watch?v=wBX0XDAf43M&list=PLu0URCSFq-gozEm1CZuvCsx_eixmuplQF";
                }
                {
                  name = "Stanford CS229 Machine Learning";
                  url = "https://www.youtube.com/watch?v=jGwO_UgTS7I&list=PLoROMvodv4rMiGQp3WXShtMGgzqpfVfbU";
                }
              ];
            }
            {
              name = "github profs / readmes";
              bookmarks = [
                {
                  name = "more widgets and maybe icons";
                  url = "https://gprm.itsvg.in/";
                }
                {
                  name = "makeread.me";
                  url = "https://makeread.me/";
                }
                {
                  name = "GitGlam";
                  url = "https://makeread.me/";
                }
                {
                  name = "Readme Studio";
                  url = "https://readmestudio.zenui.net/editor";
                }
              ];
            }
          ];
        };
      };
    };
  };
}
