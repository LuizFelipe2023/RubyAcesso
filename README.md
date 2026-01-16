# Sistema de Controle de Acessos

Um sistema web completo para gerenciamento de pessoas e controle de acessos, desenvolvido com **Ruby on Rails 8**, Hotwire/Turbo e Tailwind CSS.

## 🚀 Tecnologias

- **Ruby on Rails 8** - Framework principal com todas as últimas features
- **Hotwire/Turbo** - Para uma experiência SPA-like sem JavaScript complexo
- **Stimulus** - Controllers JavaScript minimalistas
- **Tailwind CSS 4.0** - Framework CSS utility-first mais moderno
- **MySQL** - Banco de dados relacional robusto e amplamente utilizado
- **Kaminari** - Paginação eficiente
- **Authentication Rails** - Sistema de autenticação padrão do Rails
- **bcrypt** - Hash de senhas seguro

## 📋 Funcionalidades

### 👥 Gestão de Pessoas
- ✅ Cadastro, edição e exclusão de pessoas
- ✅ Campos: nome completo, telefone e CPF (com máscara)
- ✅ Validação de dados no front e back-end
- ✅ Listagem com paginação e busca instantânea
- ✅ Formatação automática de telefone e CPF
- ✅ Visualização detalhada com histórico de acessos

### 🔐 Controle de Acessos
- ✅ Registro de entrada e saída de pessoas
- ✅ Assunto do acesso (entrega, reunião, visita, etc.)
- ✅ Status: Em aberto / Finalizado
- ✅ Cálculo automático do tempo de permanência
- ✅ Filtros por data, assunto e pessoa
- ✅ Histórico completo de acessos
- ✅ Interface moderna com cards e gradientes

### 👨‍💼 Gestão de Usuários do Sistema
- ✅ Sistema de autenticação padrão do Rails
- ✅ Perfis: Administrador e Usuário comum
- ✅ CRUD completo de usuários
- ✅ Filtros por email e tipo de perfil
- ✅ Proteção de rotas por autenticação

## 🎨 Interface

- Design moderno com **Tailwind CSS 4.0**
- Cards com gradientes e efeitos hover
- Ícones SVG temáticos
- Layout responsivo para mobile e desktop
- Formulários com validação visual
- Feedback visual com animações suaves
- Busca instantânea com debounce

## 🔧 Configuração

### Pré-requisitos
- Ruby 3.2+
- Rails 8.0+
- MySQL 8.0+
- Node.js 18+
- Yarn 1.22+

### Instalação

1. **Clone o repositório**
```bash
git clone [url-do-repositorio]
cd controle-acessos
```

2. **Instale as dependências**
```bash
bundle install
yarn install
```

3. **Configure o banco de dados**
```bash
# Configure o arquivo config/database.yml com suas credenciais MySQL
rails db:create
rails db:migrate
```

4. **Inicie o servidor**
```bash
rails server
```

5. **Acesse a aplicação**
```
http://localhost:3000
```

## 📁 Estrutura do Projeto

```
app/
├── controllers/         # Controladores Rails
├── models/             # Modelos com validações
├── views/              # Views com ERB e Turbo Frames
├── helpers/            # Helpers para formatação
└── javascript/         # Controllers Stimulus
```

## 🎯 Funcionalidades Técnicas

- **Hotwire/Turbo Frames** para atualizações parciais
- **Stimulus Controllers** para interatividade
- **Máscaras de input** para telefone e CPF
- **Busca com debounce** para performance
- **Paginação eficiente** com Kaminari
- **Validações** no model e controller
- **Segurança** com autenticação padrão Rails

## 📱 Responsividade

- Layout adaptativo para todos os dispositivos
- Tabelas com scroll horizontal em mobile
- Cards que se ajustam ao tamanho da tela
- Formulários otimizados para mobile

## 🔒 Segurança

- Autenticação obrigatória para todas as rotas
- Hash de senhas com bcrypt
- Proteção contra CSRF
- Validação de dados no servidor
- Confirmação para ações destrutivas

## 🚀 Deployment

O sistema está pronto para deployment em plataformas como:
- **Railway**
- **Heroku**
- **Render**
- **AWS Elastic Beanstalk**
- **Capistrano** para servidores VPS

## 📄 Licença

Este projeto está sob a licença MIT. Veja o arquivo LICENSE para mais detalhes.

## 🤝 Contribuição

1. Faça um fork do projeto
2. Crie uma branch para sua feature (`git checkout -b feature/nova-feature`)
3. Commit suas mudanças (`git commit -m 'Adiciona nova feature'`)
4. Push para a branch (`git push origin feature/nova-feature`)
5. Abra um Pull Request

## 📞 Suporte

Para suporte, entre em contato ou abra uma issue no repositório.
