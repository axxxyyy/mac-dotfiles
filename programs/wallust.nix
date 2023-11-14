{ config, pkgs, lib, ... }: {
  home.packages = [ pkgs.wallust ];
  home.file."Library/Application Support/wallust/wallust.toml".text = ''
    # wallust 2.7.*
    # -- global space -- #

    # How the image is parse, in order to get the colors:
    #  * full       - Reads the whole image (more precision, slower).
    #  * resized    - Resizes the image to 1/4th of the original, before parsing it (more color mixing, faster).
    #  * thumb      - Fast algo hardcoded to 512x512 (faster than resized).
    #  * wal        - Uses image magick `convert` to read the image (less colors).
    #  * fastresize - Much faster algo that uses SIMD. For some reason it fails on some images
    #                  where `resized` doesn't, for this reason is not replaced, but a new method.
    backend = "fastresize"

    # What color space to use to produce and select the most prominent colors:
    #  * lab      - Use CIEL*a*b color space
    #  * labmixed - Variant of lab that mixes colors, if not enough colors it fallbacks
    #                to usual lab, for that reason is not recommended in small images
    #  * labfast  - Variant of lab which ignores decimals, leading to a faster but not
    #                that much precise result. Images that work on lab/labmixed could
    #                not have "enough colors" for labfast.
    color_space = "labfast"

    # Difference between similar colors, used by the colorspace:
    #  1          Not perceptible by human eyes.
    #  1 - 2      Perceptible through close observation.
    #  2 - 10     Perceptible at a glance.
    #  11 - 49    Colors are more similar than opposite
    #  100        Colors are exact opposite
    threshold = 20

    # Use the most prominent colors in a way that makes sense, a scheme:
    #  * dark      - 8 dark colors, color0 darkest - color7 lightest, dark background light contrast
    #  * dark16    - same as dark but it displays 16 colors
    #  * harddark  - same as dark but with darker hard hue colors
    #  * light     - 8 light colors, color0 lightest - color7 darkest, light background dark contrast
    #  * light16   - same as light but displays 16 colors
    #  * softlight - counterpart of `harddark`
    filter = "dark16"

    # Templates (OPTIONAL) example entries, which are just a file you wish to apply `wallust` generated colors to.
    # [[entry]]
    # # a relative path to a file where wallust.toml is (~/.config/wallust/)
    # template = "dunstrc"
    #
    # # absolute path to the file to write the template (after templating)
    # target = "~/.config/dunst/dunstrc"
    #
    # [[entry]]
    # template = "zathurarc"
    # target = "~/.config/zathura/zathurarc"
    #
    # [[entry]]
    # template = "glava_bars"
    # target = "~/.config/glava/bars.glsl"
    [[entry]]
    template = "templates/colors.sh"
    target = "~/Library/Caches/wallust/scripts/colors.sh"

    [[entry]]
    template = "templates/discord.css"
    target = "~/Library/Caches/wallust/discord.css"
  '';
  home.file."Library/Application Support/wallust/templates/colors.sh" = {
    executable = true;
    text = ''
      background='{background}'
      foreground='{foreground}'
      cursor='{cursor}'
      color0='{color0}'
      color1='{color1}'
      color2='{color2}'
      color3='{color3}'
      color4='{color4}'
      color5='{color5}'
      color6='{color6}'
      color7='{color7}'
      color8='{color8}'
      color9='{color9}'
      color10='{color10}'
      color11='{color11}'
      color12='{color12}'
      color13='{color13}'
      color14='{color14}'
      color15='{color15}'
    '';
  };
  home.file."Library/Application Support/wallust/templates/discord.css".text = ''
    /**
     * @name Wallust Theme
     * @author axyie
     * @version 0.0.1
     * @description Original by @Gremious on GitHub.
    */

    :root {{
    	--wal-foreground: {foreground.rgb};
    	--wal-cursor: {cursor.rgb};
    	--wal-color-0-black: {color0.rgb};
    	--wal-color-1-red: {color1.rgb};
    	--wal-color-2-green: {color2.rgb};
    	--wal-color-3-yellow: {color3.rgb};
    	--wal-color-4-blue: {color4.rgb};
    	--wal-color-5-purple: {color5.rgb};
    	--wal-color-6-cyan: {color6.rgb};
    	--wal-color-7-white: {color7.rgb};
    	--wal-color-8-bright-black: {color8.rgb};
    	--wal-color-9-bright-red: {color9.rgb};
    	--wal-color-10-bright-green: {color10.rgb};
    	--wal-color-11-bright-yellow: {color11.rgb};
    	--wal-color-12-bright-blue: {color12.rgb};
    	--wal-color-13-bright-purple: {color13.rgb};
    	--wal-color-14-bright-cyan: {color14.rgb};
    	--wal-color-15-bright-white: {color15.rgb};
    	--background-light-luminance: 1.25;
    	--background-extra-light-luminance: 1.85;
    	--wal-bg-red: calc({background.red} * 255);
    	--wal-bg-green: calc({background.green} * 255);
    	--wal-bg-blue: calc({background.blue} * 255);
    	--wal-red-light: min(max(0, calc(var(--wal-bg-red) + (var(--wal-bg-red) * var(--background-light-luminance)))), 255);
    	--wal-green-light: min(max(0, calc(var(--wal-bg-green) + (var(--wal-bg-green) * var(--background-light-luminance)))), 255);
    	--wal-blue-light: min(max(0, calc((var(--wal-bg-blue) + var(--wal-bg-blue) * var(--background-light-luminance)))), 255);

    	--wal-red-extra-light: min(max(0, calc(var(--wal-bg-red) + (var(--wal-bg-red) * var(--background-extra-light-luminance)))), 255);
    	--wal-green-extra-light: min(max(0, calc(var(--wal-bg-green) + (var(--wal-bg-green) * var(--background-extra-light-luminance)))), 255);
    	--wal-blue-extra-light: min(max(0, calc((var(--wal-bg-blue) + var(--wal-bg-blue) * var(--background-extra-light-luminance)))), 255);

    	--wal-background: var(--wal-bg-red), var(--wal-bg-green), var(--wal-bg-blue);
    	--wal-background-light: var(--wal-red-light), var(--wal-green-light), var(--wal-blue-light);
    	--wal-background-extra-light: var(--wal-red-extra-light), var(--wal-green-extra-light), var(--wal-blue-extra-light);
    }}

    ::selection {{
    	color: rgb(var(--wal-foreground));
    	background: rgb(var(--wal-background-extra-light));
    }}

    .theme-dark {{
    	/* --text-normal: rgb(var(--wal-foreground)); */
    	--channels-default: rgb(var(--wal-foreground));
    	--interactive-normal: rgb(var(--wal-foreground));
    	--background-primary: rgb(var(--wal-background));
    	--brand-experiment: rgb(var(--wal-color-2-green));
    	--button-secondary-background: rgb(var(--wal-background));
    	--bg-overlay-3: rgb(var(--wal-background-light));
    	--background-secondary: rgb(var(--wal-background-light));
    	--background-secondary-alt: rgb(var(--wal-background-extra-light));
    	--background-floating: rgb(var(--wal-background));
    	--background-modifier-hover: rgba(0, 0, 0, 0.20);
    	--background-modifier-active: rgba(0, 0, 0, 0.25);
    	--background-modifier-selected: rgba(0, 0, 0, 0.30);
    	--scrollbar-auto-thumb: rgb(var(--wal-background-extra-light));
    	--scrollbar-auto-track: rgba(var(--wal-red-light), var(--wal-green-light), var(--wal-blue-light), 0.75);
    	--scrollbar-thin-thumb: rgb(var(--wal-foreground))
    	--search-popout-option-fade: 0;
    	--search-popout-option-fade-hover: linear-gradient(90deg, rgba(var(--wal-red-extra-light), var(--wal-green-extra-light), var(--wal-blue-extra-light), 0), var(--wal-background-extra-light) 50%);
    	--background-mobile-primary: rgb(var(--wal-background));
    	--background-mobile-secondary: rgb(var(--wal-background-light));
    }}
  '';
}
