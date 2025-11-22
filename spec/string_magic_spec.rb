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
    context "conversões básicas" do 
      
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
    end

    context "edge cases" do
      it "lida com strings vazias" do
        expect(StringMagic.to_camel_case("")).to eq("")
      end
      
      it "lida com valores nulos(nil)" do
        expect(StringMagic.to_camel_case(nil)).to eq("")
      end

      it "manipula a palavra única" do
        expect(StringMagic.to_camel_case("user")).to eq("user")
      end

      it "lida com strings com números" do
        expect(StringMagic.to_camel_case("user_123_name")).to eq("user123Name")
      end

      it "lida com vários sublinhados" do
        expect(StringMagic.to_camel_case("user___name")).to eq("userName")
      end

      it "manipula separadores mistos" do
        expect(StringMagic.to_camel_case("user-name_test data")).to eq("userNameTestData")
      end

      it "lida com strings com três ou mais palavras" do
        expect(StringMagic.to_camel_case("first_middle_last_name")).to eq("firstMiddleLastName")
      end

      it "lida com palavras maiúsculas" do
        expect(StringMagic.to_camel_case("USER_NAME")).to eq("userName")
      end
    end

    context "casos com acentos"  do 
      it "preserva caracteres acentuados" do
        expect(StringMagic.to_camel_case(nome_usuário)). to eq("nomeUsuário")
      end
    end
  end

  describe ".to_title_case" do
    context "conversões básicas" do 
      
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
    end

    context "edge cases" do
      it "lida com strings vazias" do
        expect(StringMagic.to_title_case("")).to eq("")
      end
      
      it "lida com valores nulos(nil)" do
        expect(StringMagic.to_title_case(nil)).to eq("")
      end

      it "lida com strings e com números" do
        expect(StringMagic.to_title_case("hello world 123")).to eq("Hello World 123")
      end

      it "Lida com entrada de dados em maiúsculas e minúsculas mistas" do
        expect(StringMagic.to_title_case("hELLo WoRLd")).to eq("Hello World")
      end

      it "lida com strings com hífens" do
        expect(StringMagic.to_title_case("hello-world")).to eq("Hello World")
      end

      it "lida com multiplos espaços" do
        expect(StringMagic.to_title_case("hello    world")).to eq("Hello World")
      end

      it "lida com frases longas" do
        expect(StringMagic.to_title_case("the quick brown fox")).to eq("The Quick Brown Fox")
      end

      it "lida com palavras de caráter únicos" do
        expect(StringMagic.to_title_case("i am a developer")).to eq("I Am A Developer")
      end
    end

    context "casos com acentos" do 
      it "preserva e capitaliza caracteres acentuados" do
        expect(StringMagic.to_title_case("josé maria")).to eq("José Maria")
      end

      it "lida com caracteres maisúculos acentuados" do
        expect(StringMagic.to_title_case("JOSÉ MARIA")).to eq("José Maria")
      end
    end
  end

  describe ".remove_special_chars" do
    context "remoção básica" do 
      
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
    end

    context "edge cases" do 
      it "lida com strings que contêm apenas caracteres especiais" do
        expect(StringMagic.remove_special_chars("!@#$%")).to eq("")
      end
  
      it "lida com strings vazias" do
        expect(StringMagic.remove_special_chars("")).to eq("")
      end
      
      it "lida com valores nulos(nil)" do
        expect(StringMagic.remove_special_chars(nil)).to eq("")
      end

      it "lida com strings com pontuação" do
        expect(StringMagic.remove_special_chars("Hello, World!")).to eq("Hello World")
      end

      it "lida com strings com suportes" do
        expect(StringMagic.remove_special_chars("test[123]")).to eq("test123")
      end

      it "lida com strings com citações" do
        expect(StringMagic.remove_special_chars("'hello' \"world\"")).to eq("hello world")
      end

      it "lida com strings com símbolos de moeda" do
        expect(StringMagic.remove_special_chars("$100.50")).to eq("10050")
      end

      it "lida com strings com operadores matemáticos" do
        expect(StringMagic.remove_special_chars("2+2=4")).to eq("224")
      end

      it "lida com strings com sublinhados" do
        expect(StringMagic.remove_special_chars("hello_world")).to eq("helloworld")
      end

      it "lida com strings com vários espaços consecutivos" do
        expect(StringMagic.remove_special_chars("hello    world")).to eq("hello    world")
      end

      it "preserva o caso" do
        expect(StringMagic.remove_special_chars("Hello@World!")).to eq("HelloWorld")
      end
    end

    context "casos com acentos" do 
      it "remove caracteres acentuados por padrão" do
        expect(StringMagic.remove_special_chars("José María")).to eq("Jos Mara")
      end

      it "Lida com conteúdo misto" do
        expect(StringMagic.remove_special_chars("user@josé.com")).to eq("userjoscom")
      end
    end
  end

  # Tetes adicionais para comportamento em conjunto
  describe "testes de integração" do 
    it "conversões em cadei corretamente" do
      input = "getUserHTTPResponse"
      snake = StringMagic.to_snake_case(input)
      camel = StringMagic.to_camel_case(snake)

      expect(snake).to eq("get_user_http_response")
      expect(camel).to eq("getUserHttpResponse")
    end

    it "lida com strings complexas do mundo real" do 
      input = "user-profile_data123 Test!"
      clean = StringMagic.remove_special_chars(input)
      snake = StringMagic.to_snake_case(clean)

      expect(clean).to eq("userprofiledata123 Test")
      expect(snake).to eq("userprofiledata123_test")
    end

    it "preserva dados através de conversões" do 
      original = "test_data_123"
      title = StringMagic.to_title_case(original)
      snake = StringMagic.to_snake_case(title)

      expect(snake).to eq(original)
    end
  end
end