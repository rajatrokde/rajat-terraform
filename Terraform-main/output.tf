output "user-name" {
  value = "Hello ${var.username}"
}

output "user-age" {
  value = "${var.username}, Your age is ${var.age}"
}

output "fruits-name" {
  value = "${var.username}, Your favorite fruit is ${var.fruits[1]}"
}

output "userage-map" {
  value = "The name of the student is ${var.username} and his/her age is ${lookup(var.userage-map, var.username)}"
}

// To define variable in non interractive mode or directly in command line mode, do
//terraform plan -var "username=shubham"  -var "age=28" --var 'users["user1", "user2", "user3"]'

output "name" {
  value = "Hello my name is ${var.user} and my age is ${var.age}"
}
