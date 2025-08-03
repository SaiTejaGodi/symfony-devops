variable "region" {
  description = "AWS Region"
  type        = string
  default     = "eu-central-1"
}

variable "app_name" {
  description = "Name of the application"
  type        = string
  default     = "symfony-app"
}

variable "ecr_image_url" {
  description = "Full ECR image URI"
  type        = string
}

variable "container_port" {
  description = "Port the container exposes"
  type        = number
  default     = 8000
}
