local present, shade = pcall(require, "shade")

if not present then
  return
end

shade.setup {
  overlay_opacity = 50,
  opacity_step = 1,
  exclude_filetypes = { "NvimTree" },
}
