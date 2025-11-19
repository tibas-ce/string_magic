require "string_magic"

RSpec.describe StringMagic do
  describe ".to_snake_case" do
    it "converte camelCase para snake_case" do
      expect(StringMagic.to_snake_case("userName")).to eq("user_name")
    end

    it "converte PascalCase para snake_case" do
      expect(StringMagic.to_snake_case("UserName")).to eq("user_name")
    end

    it "lida com strings que contêm espaços" do
      expect(StringMagic.to_snake_case("user Name")).to eq("user_name")
    end

    it "lida com strings com várias letras maiúsculas" do
      expect(StringMagic.to_snake_case("getUserHTTPResponse")).to eq("getUserHTTPResponse")
    end

    it "lida com strings em snake_case" do
      expect(StringMagic.to_snake_case("user_name")).to eq("user_name")
    end

    it "lida com strings vazias" do
      expect(StringMagic.to_snake_case("")).to eq("")
    end
  end
end