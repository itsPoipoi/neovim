return {
  "nvim-mini/mini.ai",
  opts = {
    custom_textobjects = {
      w = function(ai_type, id, opts)
        if ai_type == "a" then
          return {
            {
              -- pattern, [^_]pattern_*
              "%f[%a_%-]%l+%d*[_%-]*",
              "%f[%w_%-]%d+[_%-]*",
              "%f[%u_%-]%u%f[%A]%d*[_%-]*",
              "%f[%u_%-]%u%l+%d*[_%-]*",
              "%f[%u_%-]%u%u+%d*[_%-]*",
              -- __pattern
              "%f[_%-][_%-]+%l+%d*",
              "%f[_%-][_%-]+%d+",
              "%f[_%-][_%-]+%u%f[%A]%d*",
              "%f[_%-][_%-]+%u%l+%d*",
              "%f[_%-][_%-]+%u%u+%d*",
            },
          }
        end
        if ai_type == "i" then
          local reg = MiniAi.find_textobject("a", id, opts)
          if reg then
            local line = vim.fn.getline(reg.from.line)
            local _, s = line:find("^[_%-]*.", reg.from.col)
            local e = line:sub(1, reg.to.col):find(".[_%-]*$")
            return vim.tbl_deep_extend("force", reg, { from = { col = s }, to = { col = e } })
          end
        end
      end,
    },
  },
}
