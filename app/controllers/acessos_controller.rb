class AcessosController < ApplicationController
  before_action :set_acesso, only: %i[ show edit update destroy ]
  
  def index
    @acessos = Acesso.all

    if params[:assunto].present?
      @acessos = @acessos.where("assunto LIKE ?", "%#{params[:assunto]}%")
    end

    if params[:entrada].present?
      @acessos = @acessos.where("DATE(entrada) = ?", params[:entrada])
    end

    if params[:saida].present?
      @acessos = @acessos.where("DATE(saida) = ?", params[:saida])
    end

    @acessos = @acessos.order(entrada: :desc).page(params[:page]).per(5)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end



  def show
  end


  def new
    @acesso = Acesso.new
  end


  def edit
  end


  def create
    @acesso = Acesso.new(acesso_params)

    respond_to do |format|
      if @acesso.save
        format.html { redirect_to @acesso, notice: "Acesso was successfully created." }
        format.json { render :show, status: :created, location: @acesso }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @acesso.errors, status: :unprocessable_entity }
      end
    end
  end

 
  def update
    respond_to do |format|
      if @acesso.update(acesso_params)
        format.html { redirect_to @acesso, notice: "Acesso was successfully updated.", status: :see_other }
        format.json { render :show, status: :ok, location: @acesso }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @acesso.errors, status: :unprocessable_entity }
      end
    end
  end


  def destroy
    @acesso.destroy!

    respond_to do |format|
      format.html { redirect_to acessos_path, notice: "Acesso was successfully destroyed.", status: :see_other }
      format.json { head :no_content }
    end
  end

  private

    def set_acesso
      @acesso = Acesso.find(params.expect(:id))
    end


    def acesso_params
      params.expect(acesso: [ :assunto, :pessoa_id, :entrada, :saida ])
    end
end
