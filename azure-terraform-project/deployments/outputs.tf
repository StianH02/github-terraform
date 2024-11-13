output "global_suffix" {
  description = "Random suffix for naming resources."
  value       = data.terraform_remote_state.global.outputs.global_suffix
}