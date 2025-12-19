# Terraform Netlify Module

![Terraform](https://img.shields.io/badge/Terraform-%235835CC?logo=terraform&logoColor=white)
![Netlify](https://img.shields.io/badge/Netlify-%2300C7B7?logo=netlify&logoColor=white)
![License](https://img.shields.io/badge/License-MIT-blue)
![Maintenance](https://img.shields.io/badge/Maintained-yes-green)

A Terraform module for provisioning and managing Netlify sites, deploy keys, and environment configurations.

## Features

- 🚀 Create and manage Netlify sites
- 🔑 Configure deploy keys and webhooks
- 🌐 Set up custom domains and DNS
- 🔒 Manage environment variables and secrets
- 📦 Support for build settings and plugins

## Requirements

| Name | Version |
|------|---------|
| terraform | >= 1.0 |
| netlify | >= 0.6.0 |

## Usage

```hcl
module "netlify_site" {
  source = "your-org/netlify/module"

  name        = "my-awesome-site"
  repo_url    = "https://github.com/your-org/your-repo"
  repo_branch = "main"

  build_command   = "npm run build"
  publish_dir     = "dist"

  environment_variables = {
    NODE_ENV = "production"
    API_URL  = "https://api.example.com"
  }

  custom_domain = "example.com"
}
```

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| `name` | Name of the Netlify site | `string` | n/a | ✅ |
| `repo_url` | Repository URL for continuous deployment | `string` | n/a | ✅ |
| `repo_branch` | Branch to deploy from | `string` | `"main"` | ❌ |
| `build_command` | Build command to run | `string` | `""` | ❌ |
| `publish_dir` | Directory to publish | `string` | `"public"` | ❌ |
| `environment_variables` | Environment variables for builds | `map(string)` | `{}` | ❌ |
| `custom_domain` | Custom domain for the site | `string` | `null` | ❌ |
| `deploy_previews` | Enable deploy previews for PRs | `bool` | `true` | ❌ |
| `branch_deploys` | Enable branch deploys | `bool` | `false` | ❌ |

## Outputs

| Name | Description |
|------|-------------|
| `site_id` | The unique ID of the Netlify site |
| `site_url` | The default Netlify URL for the site |
| `deploy_hook_url` | Webhook URL to trigger deploys |
| `domain` | The custom domain (if configured) |

## Examples

### Basic Site

```hcl
module "basic_site" {
  source = "your-org/netlify/module"

  name     = "basic-site"
  repo_url = "https://github.com/org/repo"
}
```

### Site with Custom Domain and Environment Variables

```hcl
module "production_site" {
  source = "your-org/netlify/module"

  name        = "production-app"
  repo_url    = "https://github.com/org/app"
  repo_branch = "production"

  build_command = "npm ci && npm run build"
  publish_dir   = "build"

  environment_variables = {
    NODE_ENV     = "production"
    DATABASE_URL = var.database_url
    API_KEY      = var.api_key
  }

  custom_domain   = "app.example.com"
  deploy_previews = true
  branch_deploys  = false
}
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

MIT License. See [LICENSE](LICENSE) for details.
