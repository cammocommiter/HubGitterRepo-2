\A
setup do
  @object = Object.new
  @object.extend(Greeter)
end

should "greet person" do
  @object.stubs(:format).returns("Hello {{NAME}}")
  assert_equal "Hello World", @object.greet("World")
end

should "greet person in pirate" do
  @object.stubs(:format).returns("Avast {{NAME}} lad!")
  assert_equal "Avast Jim lad!", @object.greet("Jim")
end
