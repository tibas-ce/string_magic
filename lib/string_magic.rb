# frozen_string_literal: true

require_relative "string_magic/version"

module StringMagic
  class Error < StandardError; end

  def self.to_snake_case(string)
    # Retorna uma string vazia caso o valor seja nil ou vazio. Isso evita erros quando tentamos chamar métodos em nil.
    return "" if string.nil? || string.empty?

    string
       # Adiciona um underscore entre uma letra maiúscula seguida de um acrônimo, por exemplo: "HTTPResponse" → "HTTP_Response"
      .gsub(/([A-Z]+)([A-Z][a-z])/, '\1_\2')
      # Adiciona um underscore entre letras minúsculas/dígitos antes de uma maiúscula, por exemplo: "userName" → "user_Name"
      .gsub(/([a-z\d])([A-Z])/, '\1_\2')
      # Converte espaços ou hífens em underscores, por exemplo: "user name-role" → "user_name_role"
      .gsub(/[\s-]+/, "_")
      # Converte tudo para minúsculas, deixando no padrão snake_case
      .downcase
  end
  
end
