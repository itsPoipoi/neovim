return {
  "nvim-mini/mini.ai",
  opts = {
    custom_textobjects = {
      w = function(ai_type, id, opts)
        if ai_type == "a" then
          return {
            {
              -- pattern, [^_]pattern_*
              "%f[%d_%-%.%,]%d+[_%-%.%,%s]*",
              "%f[%a_%-%.%,]%l+[_%-%.%,%s]*",
              "%f[%u_%-%.%,]%u%f[%A][_%-%.%,%s]*",
              "%f[%u_%-%.%,]%u%l+[_%-%.%,%s]*",
              "%f[%u_%-%.%,]%u%u+[_%-%.%,%s]*",
              -- __pattern
              "%f[_%-%.%,][_%-%.%,]+%d+",
              "%f[_%-%.%,][_%-%.%,]+%l+",
              "%f[_%-%.%,][_%-%.%,]+%u%f[%A]",
              "%f[_%-%.%,][_%-%.%,]+%u%l+",
              "%f[_%-%.%,][_%-%.%,]+%u%u+",
            },
          }
        end
        if ai_type == "i" then
          local reg = MiniAi.find_textobject("a", id, opts)
          if reg then
            local line = vim.fn.getline(reg.from.line)
            local _, s = line:find("^[_%-%.%,]*.", reg.from.col)
            local e = line:sub(1, reg.to.col):find(".[_%-%.%,%s]*$")
            return vim.tbl_deep_extend("force", reg, { from = { col = s }, to = { col = e } })
          end
        end
      end,
    },
  },
}
