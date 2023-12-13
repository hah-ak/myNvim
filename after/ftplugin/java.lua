local utils = require("utils")
local map = utils.map
local packagePath = os.getenv("HOME")..'/.local/share/nvim'
local javaLspFilePath = packagePath..'/mason/packages/jdtls'
local capabilities = vim.lsp.protocol.make_client_capabilities()
local project_name = vim.fn.fnamemodify(vim.fn.getcwd(), ':p:h:t')

local workspace_dir = os.getenv('HOME')..'/.workspace/' .. project_name

local status_cmp_ok, cmp_nvim_lsp = pcall(require, "cmp_nvim_lsp")
if not status_cmp_ok then
    return
end
capabilities.textDocument.completion.completionItem.snippetSupport = true
capabilities = cmp_nvim_lsp.default_capabilities(capabilities)


local bundles = {}

vim.list_extend(bundles, vim.split(vim.fn.glob(os.getenv('HOME')..'/.local/share/nvim/mason/packages/java-debug-adapter/extension/server/com.microsoft.java.debug.plugin-*.jar',1), '\n'))
vim.list_extend(bundles, vim.split(vim.fn.glob(os.getenv('HOME')..'/.local/share/nvim/mason/packages/java-test/extension/server/*.jar',1), '\n'))
local config = {  
    cmd = {
        '/Library/Java/JavaVirtualMachines/temurin-17.jdk/Contents/Home/bin/java',
        '-Declipse.application=org.eclipse.jdt.ls.core.id1',
        '-Dosgi.bundles.defaultStartLevel=4',
        '-Declipse.product=org.eclipse.jdt.ls.core.product',
        '-Dlog.protocol=true',
        '-Dlog.level=ALL',
        '-Xms1g',
        '--add-modules=ALL-SYSTEM',
        '--add-opens', 'java.base/java.util=ALL-UNNAMED',
        '--add-opens', 'java.base/java.lang=ALL-UNNAMED',
        "-javaagent:"..javaLspFilePath.."/lombok.jar",
        "-Xbootclasspath/a:"..javaLspFilePath.."/lombok.jar",
        '-jar', javaLspFilePath..'/plugins/org.eclipse.equinox.launcher_1.6.500.v20230717-2134.jar',
        '-configuration',javaLspFilePath..'/config_mac',
        '-data', workspace_dir
        
    },
    root_dir = require('jdtls.setup').find_root({'.git', 'mvnw', 'gradlew'}),
    settings = {
        java = {
            configuration = {
              runtimes = {
                {
                  name = "JavaSE-11",
                  path = '/Library/Java/JavaVirtualMachines/temurin-11.jdk/'
                },
                {
                  name = "JavaSE-17",
                  path = '/Library/Java/JavaVirtualMachines/temurin-17.jdk/'
                }
              },
            }
         }
    }, 
    init_options = {
        bundles = bundles,
    },
    on_attach = function(client, bufnr)
        -- require('jdtls').setup_dap({hotcodereplace = 'auto'})
        -- require('jdtls.setup').add_commands()
        map('n','<A-o>', '<Cmd>lua require(\'jdtls\').organize_imports()<CR>',{silent=true})
        map('n','crv', '<Cmd>lua require(\'jdtls\').extract_variable()<CR>',{silent=true})
        map('v','crv', '<Esc><Cmd>lua require(\'jdtls\').extract_variable(true)<CR>',{silent=true})
        map('n','crc', '<Cmd>lua require(\'jdtls\').extract_constant()<CR>',{silent=true})
        map('v','crc', '<Esc><Cmd>lua require(\'jdtls\').extract_constant(true)<CR>',{silent=true})
        map('v','crm', '<Esc><Cmd>lua require(\'jdtls\').extract_method(true)<CR>',{silent=true})
        map('n','<leader>dn','<Cmd>lua require(\'jdtls\').test_nearest_method()<CR>',{silent=true})
        map('n','<leader>df','<Cmd>lua require(\'jdtls\').test_class()<CR>',{silent = true})
    end,
    capabilities=capabilities,
}
require('jdtls').start_or_attach(config)
