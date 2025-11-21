# StringMagic 🪄

> ⚠️ **Projeto de Estudos** - Esta gem foi criada como exercício de aprendizado de desenvolvimento de gems Ruby, TDD e manipulação de strings.

StringMagic fornece um conjunto simples e eficiente de funções utilitárias para conversão e transformação de strings.

Ideal para quem deseja padronizar strings ou aprender boas práticas de desenvolvimento Ruby.

---

## 📦 Instalação
```bash
gem install string_magic
```

Ou adicione ao seu Gemfile:
```ruby
gem 'string_magic'
```

---

## 🔧 API

Abaixo está um resumo das funções disponíveis:

| Função                | Descrição                                                | Exemplo                           |
|----------------------|------------------------------------------------------------|-----------------------------------|
| `to_snake_case`      | Converte uma string para `snake_case`.                    | `"UserName"` → `"user_name"`      |
| `to_camel_case`      | Converte uma string para `camelCase`.                     | `"user_name"` → `"userName"`      |
| `to_title_case`      | Converte para *Title Case*.                                | `"hello_world"` → `"Hello World"` |
| `remove_special_chars` | Remove caracteres especiais, com opção de manter espaços. | `"hello@world!"` → `"helloworld"` |

---

## 🚀 Uso

### to_snake_case

Converte strings para snake_case:
```ruby
StringMagic.to_snake_case("userName")        # => "user_name"
StringMagic.to_snake_case("UserName")        # => "user_name"
StringMagic.to_snake_case("user name")       # => "user_name"
StringMagic.to_snake_case("getUserHTTP")     # => "get_user_http"
```

### to_camel_case

Converte strings para camelCase:
```ruby
StringMagic.to_camel_case("user_name")       # => "userName"
StringMagic.to_camel_case("user name")       # => "userName"
StringMagic.to_camel_case("user-name")       # => "userName"
```

### to_title_case

Converte strings para Title Case:
```ruby
StringMagic.to_title_case("hello world")     # => "Hello World"
StringMagic.to_title_case("HELLO WORLD")     # => "Hello World"
StringMagic.to_title_case("hello_world")     # => "Hello World"
```

### remove_special_chars

Remove caracteres especiais:
```ruby
StringMagic.remove_special_chars("hello@world!")                    # => "helloworld"
StringMagic.remove_special_chars("hello world!", keep_spaces: false) # => "helloworld"
StringMagic.remove_special_chars("user#123")                        # => "user123"
```

---

## 🧪 Testes
```bash
bundle exec rspec spec
```

---

## 🎯 Status do Projeto

- ✅ Implementação básica completa
- ✅ Testes com RSpec
- ✅ Tratamento de edge cases
- 📝 Funcionalidades planejadas: suporte a Unicode

---

## 📚 Aprendizados

Este projeto me ajudou a aprender:
- Estrutura de gems Ruby com Bundler
- TDD com RSpec
- Manipulação de strings e regex
- Documentação de código
- Versionamento semântico

---

## 🤝 Contribuindo

Obrigado pelo interesse em contribuir com o projeto **StringMagic**!  
Apesar de ser uma gem de estudos, contribuições, melhorias e sugestões são muito bem-vindas.

---

## 👨‍💻 Autor

Tibério dos Santos Ferreira
GitHub: https://github.com/tibas-ce

---

## 📄 Licença

MIT