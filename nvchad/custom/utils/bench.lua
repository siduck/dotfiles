vim.api.nvim_create_user_command("K", function()
  local function kek()
    local function benchmark(func, count)
      local ts = vim.loop.hrtime()
      for _ = 1, count do
        func()
      end

      return (("%.3fms"):format((vim.loop.hrtime() - ts) / 1000000))
    end

    local function abc()
      local cond = "sp"
      local _ac = cond and "split" or "vsplit"
    end

    local function xyz()
      local cond = "sp"

      local a = {
        sp = "split",
        vsp = "vsplit",
      }

      local _ac = a[cond]
    end

    print(" abc " .. benchmark(abc, 100), " xyz : " .. benchmark(xyz, 100))
  end

  for i = 1, 5 do
    kek()
  end
end, {})
