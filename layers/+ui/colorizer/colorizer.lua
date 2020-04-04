-- nvim-colorizer
-- ===
-- See https://github.com/norcalli/nvim-colorizer.lua


DEFAULT_OPTIONS = {
  names    = true;         -- "Name" codes like Blue
  RGB      = true;         -- #RGB hex codes
  RRGGBB   = true;         -- #RRGGBB hex codes
  RRGGBBAA = true;         -- #RRGGBBAA hex codes
  rgb_fn   = false;        -- CSS rgb() and rgba() functions
  hsl_fn   = false;        -- CSS hsl() and hsla() functions
  css      = false;        -- Enable all CSS features: rgb_fn, hsl_fn, names, RGB, RRGGBB
  css_fn   = false;        -- Enable all CSS *functions*: rgb_fn, hsl_fn
  -- Available modes: foreground, background
  mode     = 'background'; -- Set the display mode.
}

require 'colorizer'.setup {
  'javascript';
  'javascriptreact';
  'typescript';
  'typescriptreact';
  javascript = { rgb_fn = true; };
  css = { rgb_fn = true; };
  scss = { rgb_fn = true; };
  sass = { rgb_fn = true; };
  stylus = { rgb_fn = true; };
  vim = { names = false; };
  html = {
    mode = 'foreground';
  }
}
