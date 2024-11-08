output "networking-identifier" {
  description = "This is the random string that identifies our networking resources"
  value       = random_string.networking-identifier.result
}
