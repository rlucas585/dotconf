require("rlucas.remap") -- automatically source remap file
require("rlucas.packer")
require("rlucas.set")

-- It is important to setup neoconf.nvim BEFORE lspconfig
require("neoconf").setup({
  -- local_settings = ".neoconf.json",
  -- global_settings = "neoconf.json",
})

