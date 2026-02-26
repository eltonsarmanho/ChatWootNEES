class ContactFormMailer < ApplicationMailer
  def notify(nome:, email:, telefone:, assunto:, mensagem:, protocolo:)
    @nome = nome
    @email = email
    @telefone = telefone
    @assunto = assunto
    @mensagem = mensagem
    @protocolo = protocolo

    mail(
      to: ENV.fetch('SMTP_USERNAME', 'fasicuntins@ufpa.br'),
      from: ENV.fetch('MAILER_SENDER_EMAIL', 'fasicuntins@ufpa.br'),
      reply_to: email,
      subject: "[Formulário - #{assunto}] #{nome} — Protocolo #GP-#{protocolo}"
    )
  end
end
