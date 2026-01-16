class PessoasController < ApplicationController
  before_action :set_pessoa, only: %i[ show edit update destroy ]
  

  def index
    if params[:query].present?
      query = "%#{params[:query].downcase}%"
      @pessoas = Pessoa.where(
        "LOWER(nome) LIKE :q OR LOWER(telefone) LIKE :q OR LOWER(cpf) LIKE :q",
        q: query
      )
    else
      @pessoas = Pessoa.order(:nome)
    end

    @pessoas = @pessoas.page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end


  def show
  end


  def new
    @pessoa = Pessoa.new
  end

  
  def edit
  end

  
  def create
    @pessoa = Pessoa.new(pessoa_params)

    respond_to do |format|
      if @pessoa.save
        format.html { redirect_to @pessoa, notice: "Pessoa was successfully created." }
        format.json { render :show, status: :created, location: @pessoa }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def update
    respond_to do |format|
      if @pessoa.update(pessoa_params)
        format.html { redirect_to @pessoa, notice: "Pessoa was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @pessoa }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pessoa.errors, status: :unprocessable_entity }
      end
    end
  end

  
  def destroy
    @pessoa.destroy!

    respond_to do |format|
      format.html { redirect_to pessoas_path, notice: "Pessoa was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private
   
    def set_pessoa
      @pessoa = Pessoa.find(params.expect(:id))
    end

    
    def pessoa_params
      params.expect(pessoa: [ :nome, :telefone, :cpf ])
    end


end
