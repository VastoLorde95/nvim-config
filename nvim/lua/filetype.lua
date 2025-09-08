vim.filetype.add({
  pattern = {
    [".*/templates/.*%.yaml"] = "helm",
    ["Chart.yaml"] = "helm",
    ["values.yaml"] = "helm",
  },
})
