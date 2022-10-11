terraform {
  cloud {
    # TFC org is configured via the TF_CLOUD_ORGANIZATION envvar
    hostname = "app.terraform.io"
    workspaces {
      tags = [
        "cueniform",
        "infrastructure",
      ]
    }
  }
}
