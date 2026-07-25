output "cluster_endpoint" {
  description = "EKS Cluster End Point"
  value       = aws_eks_cluster.main.endpoint 
}

output "cluster_name" {
    description = "EKS Cluster Name"
    value       = aws_eks_cluster.main.name
}