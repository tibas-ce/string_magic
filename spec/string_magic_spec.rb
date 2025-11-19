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

  describe ".to_title_case" do
    it "converte lowercase para Title Case" do
      expect(StringMagic.to_title_case("hello world")).to eq("Hello Word")
    end

    it "converte UPPERCASE para Title Case" do
      expect(StringMagic.to_title_case("HELLO WORLD")).to eq("Hello World")
    end

    it "converte snake_case para Title Case" do
      expect(StringMagic.to_title_case("hello_world")).to eq("Hello World")
    end

    it "lida com palavras individuais" do
      expect(StringMagic.to_title_case("hello")).to eq("Hello")
    end

    it "lida com strings vazias" do
      expect(StringMagic.to_title_case("")).to eq("")
    end
  end
end