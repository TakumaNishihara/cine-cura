Admin.create(
  admin.email: "aaa@mail",
  admin.password: ENV['ADMIN_PASSWORD']
)

User.create(
  name: "TANAKA",
  email: "abc@mail",
  password: ENV['USER1_PASSWORD']
)