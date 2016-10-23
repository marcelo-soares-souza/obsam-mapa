class DispositivosController < ApplicationController
  before_action :set_dispositivo, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :edit, :update, :destroy]
  before_action :load_tipos_subtipos
  before_action only: [:edit, :update, :destroy] { check_owner Dispositivo.friendly.find(params[:id]).user_id }

  # GET /dispositivos
  # GET /dispositivos.json
  def index
    @dispositivos = Dispositivo.all
  end

  # GET /dispositivos/1
  # GET /dispositivos/1.json
  def show
  end

  # GET /dispositivos/new
  def new
    @dispositivo = Dispositivo.new
  end

  # GET /dispositivos/1/edit
  def edit
  end

  # POST /dispositivos
  # POST /dispositivos.json
  def create
    @dispositivo = Dispositivo.new(dispositivo_params)
    @dispositivo.user_id = current_user.id

    respond_to do |format|
      if @dispositivo.save
        format.html { redirect_to @dispositivo, notice: 'Dispositivo was successfully created.' }
        format.json { render :show, status: :created, location: @dispositivo }
      else
        format.html { render :new }
        format.json { render json: @dispositivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dispositivos/1
  # PATCH/PUT /dispositivos/1.json
  def update
    respond_to do |format|
      if @dispositivo.update(dispositivo_params)
        format.html { redirect_to @dispositivo, notice: 'Dispositivo was successfully updated.' }
        format.json { render :show, status: :ok, location: @dispositivo }
      else
        format.html { render :edit }
        format.json { render json: @dispositivo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dispositivos/1
  # DELETE /dispositivos/1.json
  def destroy
    @dispositivo.destroy
    respond_to do |format|
      format.html { redirect_to dispositivos_url, notice: 'Dispositivo was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_dispositivo
      @dispositivo = Dispositivo.friendly.find(params[:id])
    end

    def dispositivo_params
      params.require(:dispositivo).permit(:nome, :logradouro, :cidade, :uf, :cep, :telefone, :email, :politica_publica, :tipo_atendimento, :dias_atendimento, :horario_atendimento, :clientela, :area_abrangencia, :primeiro_atendimento, :documentacao_atendimento, :pagamento, :descricao, :tipo, :subtipo, :slug, :latitude, :longitude, :user_id)
    end
end
