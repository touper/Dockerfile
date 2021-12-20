primary_datacenter = "dc1"
acl {
  enabled = true
  default_policy = "deny"
  enable_token_persistence = true
  tokens {
    master = "df0dfdd5-c2d2-4e64-ae73-354d4bb698cb"
    agent = "f9c739d4-f637-2fa5-ab47-6d89de4ea1a3"
  }
}