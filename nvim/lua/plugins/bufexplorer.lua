return {
  'jlanzarotta/bufexplorer',
  config = function()
    vim.cmd([[
      map <leader>o <leader>be
      let g:bufExplorerShowNoName=1
      let g:bufExplorerDefaultHelp=0
      let g:bufExplorerShowDirectories=0
      let g:bufExplorerShowTabBuffer=1
    ]])
  end
}
