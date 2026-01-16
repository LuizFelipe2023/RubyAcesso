# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end


puts "🌱 Criando usuário admin..."

admin_email = "felipinhoneves2011@gmail.com"

admin = User.find_or_initialize_by(email_address: admin_email)

admin.assign_attributes(
  password: "acesso1601",
  password_confirmation: "acesso1601",
  isAdmin: true
)

if admin.save
  puts "✅ Admin criado/atualizado com sucesso"
else
  puts "❌ Erro ao criar admin:"
  admin.errors.full_messages.each { |msg| puts " - #{msg}" }
end

puts "🌱 Criando pessoas..."

pessoas = [
  { nome: "João da Silva",      telefone: "(11) 99999-9999", cpf: "123.456.789-00" },
  { nome: "Maria Oliveira",     telefone: "(21) 98888-8888", cpf: "987.654.321-00" },
  { nome: "Carlos Pereira",     telefone: "(31) 97777-7777", cpf: "111.222.333-44" },
  { nome: "Ana Souza",          telefone: "(41) 96666-6666", cpf: "222.333.444-55" },
  { nome: "Lucas Fernandes",    telefone: "(51) 95555-5555", cpf: "333.444.555-66" },
  { nome: "Beatriz Lima",       telefone: "(61) 94444-4444", cpf: "444.555.666-77" },
  { nome: "Rafael Martins",     telefone: "(71) 93333-3333", cpf: "555.666.777-88" },
  { nome: "Juliana Costa",      telefone: "(81) 92222-2222", cpf: "666.777.888-99" },
  { nome: "Eduardo Rodrigues",  telefone: "(91) 91111-1111", cpf: "777.888.999-00" }
]

pessoas.each do |attrs|
  pessoa = Pessoa.find_or_initialize_by(cpf: attrs[:cpf])
  pessoa.assign_attributes(attrs)

  if pessoa.save
    puts "✅ Pessoa #{pessoa.nome} criada/atualizada"
  else
    puts "❌ Erro ao salvar #{attrs[:nome]}:"
    pessoa.errors.full_messages.each { |msg| puts " - #{msg}" }
  end
end

puts "🎉 Seed de pessoas finalizado!"

puts "🌱 Criando acessos..."

pessoas = Pessoa.all

if pessoas.empty?
  puts "⚠️ Nenhuma pessoa encontrada. Crie pessoas antes de rodar este seed."
  return
end

pessoas.each do |pessoa|
  3.times do |i|
    entrada = Time.current - rand(1..10).days - rand(1..8).hours
    saida   = entrada + rand(1..4).hours

    acesso = Acesso.find_or_initialize_by(
      pessoa: pessoa,
      entrada: entrada.change(sec: 0)
    )

    acesso.assunto = [
      "Reunião",
      "Visita",
      "Entrega",
      "Manutenção",
      "Atendimento"
    ].sample

    acesso.saida = saida.change(sec: 0)

    if acesso.save
      puts "✅ Acesso criado para #{pessoa.nome} (#{acesso.assunto})"
    else
      puts "❌ Erro ao criar acesso para #{pessoa.nome}:"
      acesso.errors.full_messages.each { |msg| puts " - #{msg}" }
    end
  end
end

puts "🎉 Seed de acessos finalizado!"


