class PageContactsController < ApplicationController
  protect_from_forgery with: :null_session

  def create
    nome     = params[:nome].to_s.strip
    email    = params[:email].to_s.strip
    telefone = params[:telefone].to_s.strip
    assunto  = params[:assunto].to_s.strip
    mensagem = params[:mensagem].to_s.strip

    if nome.blank? || email.blank? || assunto.blank? || mensagem.blank?
      return render json: { error: 'Preencha todos os campos obrigatórios.' }, status: :unprocessable_entity
    end

    protocolo = rand(10_000..99_999)

    ContactFormMailer.notify(
      nome: nome,
      email: email,
      telefone: telefone,
      assunto: assunto,
      mensagem: mensagem,
      protocolo: protocolo
    ).deliver_later

    render json: { protocolo: protocolo }, status: :ok
  end
end
