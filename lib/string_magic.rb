# frozen_string_literal: true

require_relative "string_magic/version"

module StringMagic
  class Error < StandardError; end

  # Converte string para snake_case
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
  
  # Converte string para camelCase
  def self.to_camel_case(string)
    # Retorna string vazia se a entrada for nil ou vazia
    return "" if string.nil? || string.empty?

    # Se a string já está em camelCase, retorne como está
    return string if string.match?(/^[a-z]+(?:[A-Z][a-z0-9]*)*$/)

    # Divide a string em palavras, usando espaço, underscore ou hífen como separadores
    words = string.split(/[\s_-]+/)
    # A primeira palavra deve ser toda em minúsculas no camelCase
    first_word = words.first.downcase
    # As demais palavras devem ter a primeira letra maiúscula.
    # words[1..] pode ser nil quando a string tem apenas uma palavra, por isso usamos || [] para evitar erros.
    rest = (words[1..] || []).map { |word| word.capitalize}

    # Junta tudo, mantendo a primeira palavra minúscula e as demais capitalizadas
    ([first_word] + rest).join
  end

  # Converte string para Title Case
  def self.to_title_case(string)
    # Retorna string vazia se a entrada for nil ou vazia
    return "" if string.nil? || string.empty?

    string
      # Substitui underscores e hífens por espaço
      .gsub(/[_-]/, ' ')
      # Divide em palavras, ignorando múltiplos espaços consecutivos
      .split(/\s+/)
      # Capitaliza cada palavra (primeira letra maiúscula, resto minúsculo)
      .map(&:capitalize)
      # Junta as palavras com espaço entre elas
      .join(' ')
  end
end
