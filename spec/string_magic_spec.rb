require "string_magic"

RSpec.describe StringMagic do
  describe ".to_snake_case" do
    context "conversões básicas" do
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
        expect(StringMagic.to_snake_case("getUserHTTPResponse")).to eq("get_user_http_response")
      end

      it "lida com strings em snake_case" do
        expect(StringMagic.to_snake_case("user_name")).to eq("user_name")
      end
    end

    context "edge cases" do
      it "lida com strings vazias" do
        expect(StringMagic.to_snake_case("")).to eq("")
      end
      
      it "lida com valores nulos(nil)" do
        expect(StringMagic.to_snake_case(nil)).to eq("")
      end

      it "lida com um único caractere" do
        expect(StringMagic.to_snake_case("A")).to eq("a")
      end

      it "lida com strings e números" do
        expect(StringMagic.to_snake_case("user123Name")).to eq("user123_name")
      end

      it "lida com strings começando com números" do
        expect(StringMagic.to_snake_case("123userName")).to eq("123user_name")
      end

      it "lida com múltiplas letras maiúsculas" do
        expect(StringMagic.to_snake_case("XMLHttpRequest")).to eq("xml_http_request")
      end

      it "lida com strings com hífens" do
        expect(StringMagic.to_snake_case("user-name-test")).to eq("user_name_test")
      end

      it "lida com strings com vários espaços" do
        expect(StringMagic.to_snake_case("user   name")).to eq("user_name")
      end

      it "lida com strings com separadores mistos" do
        expect(StringMagic.to_snake_case("user-name test_data")).to eq("user_name_test_data")
      end
    end

    context "casos com acentos" do
      it "preserva caracteres acentuados" do
        expect(StringMagic.to_snake_case("nomeUsuário")).to eq("nome_usuário")
      end

      it "lida com caracteres acentuados maiúsculos" do
        expect(StringMagic.to_snake_case("nomeÚltimo")).to eq("nome_último")
      end
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
      expect(StringMagic.to_title_case("hello world")).to eq("Hello World")
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

  describe ".remove_special_chars" do
    it "remove caracteres especiais" do
      expect(StringMagic.remove_special_chars("hello@world!")).to eq("helloworld")
    end

    it "mantém caracteres alfanuméricos" do
      expect(StringMagic.remove_special_chars("user123")).to eq("user123")
    end

    it "remove multiplos caracteres especiais" do
      expect(StringMagic.remove_special_chars("h#e$l%l^o&w*o(r)l!d")).to eq("helloworld")
    end

    it "mantém os espaços por padrão" do
      expect(StringMagic.remove_special_chars("hello world!")).to eq("hello world")
    end

    it "remove espaços quando especificado" do
      expect(StringMagic.remove_special_chars("hello world!", keep_spaces: false)).to eq("helloworld")
    end

    it "lida com strings que contêm apenas caracteres especiais" do
      expect(StringMagic.remove_special_chars("!@#$%")).to eq("")
    end

    it "lida com strings vazias" do
      expect(StringMagic.remove_special_chars("")).to eq("")
    end
  end
end