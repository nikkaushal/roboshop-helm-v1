terraform {
  backend "s3" {
    bucket = "terraform-state-d88-nk"
    key    = "roboshop-ssm/terraform.tfstate"
    region = "us-east-1"
  }
}

resource "aws_ssm_parameter" "values" {
  count = length(var.inputs)
  name  = lookup(var.inputs[count.index], "name", "")
  type  = lookup(var.inputs[count.index], "type", "")
  value = lookup(var.inputs[count.index], "value", "")
}

variable "inputs" {
  default = [
    # roboshop-frontend
    {
      name  = "/roboshop-frontend/CATALOGUE_URL"
      type  = "String"
      value = "http://roboshop-catalogue.roboshop.svc.cluster.local:8080"
    },
    {
      name  = "/roboshop-frontend/CART_URL"
      type  = "String"
      value = "http://roboshop-cart.roboshop.svc.cluster.local:8080"
    },
    {
      name  = "/roboshop-frontend/USER_URL"
      type  = "String"
      value = "http://roboshop-user.roboshop.svc.cluster.local:8080"
    },
    {
      name  = "/roboshop-frontend/PAYMENT_HOST"
      type  = "String"
      value = "roboshop-payment.roboshop.svc.cluster.local"
    },
    {
      name  = "/roboshop-frontend/SHIPPING_URL"
      type  = "String"
      value = "http://roboshop-shipping.roboshop.svc.cluster.local:8080"
    },
    {
      name  = "/roboshop-frontend/RATINGS_HOST"
      type  = "String"
      value = "roboshop-ratings.roboshop.svc.cluster.local"
    },

    # roboshop-catalogue
    {
      name  = "/roboshop-catalogue/MONGODB_HOST"
      type  = "String"
      value = "mongodb.dev.roboshop.internal"
    },
    {
      name  = "/roboshop-catalogue/PORT"
      type  = "String"
      value = "8080"
    },

    # roboshop-user
    {
      name  = "/roboshop-user/MONGO_URL"
      type  = "SecureString"
      value = "mongodb://mongodb.dev.roboshop.internal:27017/users"
    },
    {
      name  = "/roboshop-user/REDIS_HOST"
      type  = "String"
      value = "valkey.dev.roboshop.internal"
    },
    {
      name  = "/roboshop-user/PORT"
      type  = "String"
      value = "8080"
    },

    # roboshop-cart
    {
      name  = "/roboshop-cart/REDIS_HOST"
      type  = "String"
      value = "valkey.dev.roboshop.internal"
    },
    {
      name  = "/roboshop-cart/CATALOGUE_URL"
      type  = "String"
      value = "http://roboshop-catalogue.roboshop.svc.cluster.local:8080"
    },
    {
      name  = "/roboshop-cart/PORT"
      type  = "String"
      value = "8080"
    },

    # roboshop-shipping
    {
      name  = "/roboshop-shipping/DB_HOST"
      type  = "String"
      value = "mysql.dev.roboshop.internal"
    },
    {
      name  = "/roboshop-shipping/DB_USER"
      type  = "String"
      value = "root"
    },
    {
      name  = "/roboshop-shipping/DB_PASS"
      type  = "SecureString"
      value = "RoboShop@1"
    },
    {
      name  = "/roboshop-shipping/CART_HOST"
      type  = "String"
      value = "roboshop-cart.roboshop.svc.cluster.local"
    },
    {
      name  = "/roboshop-shipping/PORT"
      type  = "String"
      value = "8080"
    },

    # roboshop-payment
    {
      name  = "/roboshop-payment/AMQP_HOST"
      type  = "String"
      value = "rabbitmq.dev.roboshop.internal"
    },
    {
      name  = "/roboshop-payment/AMQP_USER"
      type  = "String"
      value = "roboshop"
    },
    {
      name  = "/roboshop-payment/AMQP_PASS"
      type  = "SecureString"
      value = "RoboShop@1"
    },
    {
      name  = "/roboshop-payment/CART_HOST"
      type  = "String"
      value = "roboshop-cart.roboshop.svc.cluster.local"
    },
    {
      name  = "/roboshop-payment/USER_HOST"
      type  = "String"
      value = "roboshop-user.roboshop.svc.cluster.local"
    },
    {
      name  = "/roboshop-payment/PORT"
      type  = "String"
      value = "8080"
    },

    # roboshop-ratings
    {
      name  = "/roboshop-ratings/MYSQL_HOST"
      type  = "String"
      value = "mysql.dev.roboshop.internal"
    },
    {
      name  = "/roboshop-ratings/MYSQL_USER"
      type  = "String"
      value = "root"
    },
    {
      name  = "/roboshop-ratings/MYSQL_PASSWORD"
      type  = "SecureString"
      value = "RoboShop@1"
    },
    {
      name  = "/roboshop-ratings/MYSQL_DATABASE"
      type  = "String"
      value = "ratings"
    },
    {
      name  = "/roboshop-ratings/PORT"
      type  = "String"
      value = "8080"
    },

    # roboshop-orders
    {
      name  = "/roboshop-orders/MONGO_URL"
      type  = "SecureString"
      value = "mongodb://mongodb.dev.roboshop.internal:27017/orders"
    },
    {
      name  = "/roboshop-orders/AMQP_HOST"
      type  = "String"
      value = "rabbitmq.dev.roboshop.internal"
    },
    {
      name  = "/roboshop-orders/AMQP_USER"
      type  = "String"
      value = "roboshop"
    },
    {
      name  = "/roboshop-orders/AMQP_PASS"
      type  = "SecureString"
      value = "RoboShop@1"
    },
    {
      name  = "/roboshop-orders/CART_HOST"
      type  = "String"
      value = "roboshop-cart.roboshop.svc.cluster.local"
    },
    {
      name  = "/roboshop-orders/USER_HOST"
      type  = "String"
      value = "roboshop-user.roboshop.svc.cluster.local"
    },
    {
      name  = "/roboshop-orders/SHIPPING_URL"
      type  = "String"
      value = "http://roboshop-shipping.roboshop.svc.cluster.local:8080"
    },
    {
      name  = "/roboshop-orders/PORT"
      type  = "String"
      value = "8080"
    },

    # roboshop-notification
    {
      name  = "/roboshop-notification/MONGO_URL"
      type  = "SecureString"
      value = "mongodb://mongodb.dev.roboshop.internal:27017/notifications"
    },
    {
      name  = "/roboshop-notification/AMQP_HOST"
      type  = "String"
      value = "rabbitmq.dev.roboshop.internal"
    },
    {
      name  = "/roboshop-notification/AMQP_USER"
      type  = "String"
      value = "roboshop"
    },
    {
      name  = "/roboshop-notification/AMQP_PASS"
      type  = "SecureString"
      value = "RoboShop@1"
    },
    {
      name  = "/roboshop-notification/PORT"
      type  = "String"
      value = "8080"
    },
  ]
}
