require("mkdnflow").setup({
    filetypes = {md = true, rmd = true, markdown = true},
    create_dirs = true,
    perspective = {
        priority = 'root',
        fallback = 'current',
        root_tell = ".git"
    },
    wrap = false,
    bib = {
        default_path = "references.bib",
        find_in_root = true
    },
    silent = true,
    use_mappings_table = true,
    mappings = {
        MkdnNextLink = {'n', '<tab>'},
        MkdnPrevLink = {'n', '<s-tab>'},
        MkdnNextHeading = {'n', '<leader>]'},
        MkdnPrevHeading = {'n', '<leader>['},
        MkdnGoBack = {'n', '<BS>'},
        MkdnGoForward = {'n', '<Del>'},
        MkdnFollowLink = {{'n'}, '<CR>'},
        MkdnDestroyLink = {'n', '<M-CR>'},
        -- MkdnYankAnchorLink = {'n', 'ya'},
        -- MkdnYankFileAnchorLink = {'n', 'yfa'},
        -- MkdnIncreaseHeading = {'n', '+'},
        -- MkdnDecreaseHeading = {'n', '-'},
        -- MkdnToggleToDo = {'n', '<C-Space>'},
        MkdnNewListItem = {'i', '<CR>'}
    },
    links = {
        style = 'wiki',
        implicit_extension = nil,
        -- transform = false
        transform_implicit = function(input)
            if input:match('%d%d%d%d%-%d%d%-%d%d') then
                return('journals/'..input:gsub("-","_"))
            else
                return('pages/'..input)
            end
        end,
        -- transform_explicit = false,
        transform_explicit = function(text)
            -- text = text:gsub(" ", "-")
            -- text = text:lower()
            -- text = os.date('%Y-%m-%d_')..text
            return(text)
        end
    },
    to_do = {
        symbols = {' ', '-', 'X'},
        update_parents = true,
        not_started = ' ',
        in_progress = '-',
        complete = 'X'
    }
})
