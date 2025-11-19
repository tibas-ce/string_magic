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
      expect(StringMagic.to_snake_case("user name")).to eq("user_name")
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

  describe ".to_camel_case" do
    it "converte snake_case para camelCase" do
      expect(StringMagic.to_camel_case("user_name")).to eq("userName")
    end

    it "lida com strings que contêm espaços" do
      expect(StringMagic.to_camel_case("user name")).to eq("userName")
    end

    it "converte strings com hífens para camelCase" do
      expect(StringMagic.to_camel_case("user-name")).to eq("userName")
    end

    it "lida com strings já em camelCase" do
      expect(StringMagic.to_camel_case("userName")).to eq("userName")
    end

    it "lida com strings vazias" do
      expect(StringMagic.to_camel_case("")).to eq("")
    end
  end
end