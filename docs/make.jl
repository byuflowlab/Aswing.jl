using Documenter, Aswing

makedocs(
    sitename = "Aswing",
    modules = [Aswing],
    format=Documenter.HTML(prettyurls = get(ENV, "CI", nothing)=="true"),
    pages   = ["Home" => "index.md",
        "Installation" => "install.md",
        "Example Usage" => "example.md",
        "Library" => "library.md"]
)

# deploydocs(
#     root = ".",
#     target = "./build",
#     repo   = "github.com/byuflowlab/Aswing.jl",
#     branch = "gh-pages",
#     devbranch = "master"
# )
