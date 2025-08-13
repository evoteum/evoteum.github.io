locals {
  dns_records = {
    google_verification = {
      name    = "@"
      type    = "TXT"
      value   = "google-site-verification=8YI0w_DkUZ1MnCzPZ1ARRgxkFZWjYVL0jmIEE8ngbYo"
      ttl     = 60
      proxied = false
    },
  }
}

module "cloudflare_zone" {
  source = "github.com/evoteum/tofu-modules//cloudflare/zone"

  account_id  = var.cloudflare_account_id
  domain_name = var.homepage_url
}

module "cloudflare_record" {
  source   = "github.com/evoteum/tofu-modules//cloudflare/record"
  for_each = local.dns_records

  zone_id      = module.cloudflare_zone.id
  name         = each.value.name
  type         = each.value.type
  value        = each.value.value
  proxied      = each.value.proxied
  time_to_live = each.value.ttl
  tags = {
    repository_url = var.repository_url
    ManagedBy      = "OpenTofu"
  }

}
