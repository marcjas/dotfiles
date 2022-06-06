local capabilities = vim.lsp.protocol.make_client_capabilities()

-- Setup nvim-cmp
local cmp = require("cmp")
cmp.setup {
  mapping = {
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-y>'] = cmp.mapping.confirm({ select = true, behavior = cmp.ConfirmBehavior.Replace }),
    ['<Tab>'] = cmp.mapping(cmp.mapping.select_next_item(), {'i'}),
    ['<S-Tab>'] = cmp.mapping(cmp.mapping.select_prev_item(), {'i'}),
  },

  sources = {
    { name = 'nvim_lsp' },
  },

  formatting = {
    format = function(entry, item)
      item.menu = ({
        nvim_lsp = '[lsp]',
      })[entry.source.name]

      return item
    end,
  },
}

local function config(_config)
	return vim.tbl_deep_extend("force", {
		capabilities = require("cmp_nvim_lsp").update_capabilities(vim.lsp.protocol.make_client_capabilities()),
		on_attach = function()
			Nnoremap("gd", ":lua vim.lsp.buf.definition()<CR>")
			Nnoremap("K", ":lua vim.lsp.buf.hover()<CR>")
			Nnoremap("<leader>vws", ":lua vim.lsp.buf.workspace_symbol()<CR>")
			Nnoremap("<leader>vd", ":lua vim.diagnostic.open_float()<CR>")
			Nnoremap("[d", ":lua vim.lsp.diagnostic.goto_next()<CR>")
			Nnoremap("]d", ":lua vim.lsp.diagnostic.goto_prev()<CR>")
			Nnoremap("<leader>vca", ":lua vim.lsp.buf.code_action()<CR>")
			Nnoremap("<leader>vrr", ":lua vim.lsp.buf.references()<CR>")
			Nnoremap("<leader>vrn", ":lua vim.lsp.buf.rename()<CR>")
			Inoremap("<C-h>", "<cmd>lua vim.lsp.buf.signature_help()<CR>")
		end,
	}, _config or {})
end

require("lspconfig").pyright.setup(config())
