output "global_suffix" {
  description = "Random suffix for naming resources that need unique names."
  value       = random_string.global_suffix.result
}