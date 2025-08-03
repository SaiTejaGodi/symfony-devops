output "load_balancer_dns" {
  description = "DNS of the load balancer"
  value       = aws_lb.this.dns_name
}

output "ecs_cluster_name" {
  value = aws_ecs_cluster.this.name
}

