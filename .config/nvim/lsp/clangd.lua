return {
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
    filetypes = { "c", "cpp", "objc", "objcpp" },
    settings = {
        clangd = {
            compilationDatabasePath = "build",
        },
    }
}

