variable "fruits" {
  default = [ "apple,banana"]
}

output "fruits" {
  //value =  var.fruits[2]
  value = element(var.fruits,2)
}

variable "fruits_with-stock" {
  default = {
    apple = {
      stock = 100
    }
  }
}

output "fruit_stock" {
  value = try(var.fruits_with-stock["banana"],0)
}

output "fruit_stock_price" {
  value = lookup(var.fruits_with-stock["apple"],"price", 2)
     // try(var.fruit-with_stock["apple"].price, 2)
}