require 'test_helper'

class DispositivosControllerTest < ActionDispatch::IntegrationTest
  setup do
    @dispositivo = dispositivos(:one)
  end

  test "should get index" do
    get dispositivos_url
    assert_response :success
  end

  test "should get new" do
    get new_dispositivo_url
    assert_response :success
  end

  test "should create dispositivo" do
    assert_difference('Dispositivo.count') do
      post dispositivos_url, params: { dispositivo: { area_abrangencia: @dispositivo.area_abrangencia, cep: @dispositivo.cep, cidade: @dispositivo.cidade, clientela: @dispositivo.clientela, descricao: @dispositivo.descricao, dias_atendimento: @dispositivo.dias_atendimento, documentacao_atendimento: @dispositivo.documentacao_atendimento, email: @dispositivo.email, horario_atendimento: @dispositivo.horario_atendimento, latitude: @dispositivo.latitude, logradouro: @dispositivo.logradouro, longitude: @dispositivo.longitude, nome: @dispositivo.nome, pagamento: @dispositivo.pagamento, politica_publica: @dispositivo.politica_publica, primeiro_atendimento: @dispositivo.primeiro_atendimento, slug: @dispositivo.slug, subtipo: @dispositivo.subtipo, telefone: @dispositivo.telefone, tipo: @dispositivo.tipo, tipo_atendimento: @dispositivo.tipo_atendimento, uf: @dispositivo.uf, user_id: @dispositivo.user_id } }
    end

    assert_redirected_to dispositivo_url(Dispositivo.last)
  end

  test "should show dispositivo" do
    get dispositivo_url(@dispositivo)
    assert_response :success
  end

  test "should get edit" do
    get edit_dispositivo_url(@dispositivo)
    assert_response :success
  end

  test "should update dispositivo" do
    patch dispositivo_url(@dispositivo), params: { dispositivo: { area_abrangencia: @dispositivo.area_abrangencia, cep: @dispositivo.cep, cidade: @dispositivo.cidade, clientela: @dispositivo.clientela, descricao: @dispositivo.descricao, dias_atendimento: @dispositivo.dias_atendimento, documentacao_atendimento: @dispositivo.documentacao_atendimento, email: @dispositivo.email, horario_atendimento: @dispositivo.horario_atendimento, latitude: @dispositivo.latitude, logradouro: @dispositivo.logradouro, longitude: @dispositivo.longitude, nome: @dispositivo.nome, pagamento: @dispositivo.pagamento, politica_publica: @dispositivo.politica_publica, primeiro_atendimento: @dispositivo.primeiro_atendimento, slug: @dispositivo.slug, subtipo: @dispositivo.subtipo, telefone: @dispositivo.telefone, tipo: @dispositivo.tipo, tipo_atendimento: @dispositivo.tipo_atendimento, uf: @dispositivo.uf, user_id: @dispositivo.user_id } }
    assert_redirected_to dispositivo_url(@dispositivo)
  end

  test "should destroy dispositivo" do
    assert_difference('Dispositivo.count', -1) do
      delete dispositivo_url(@dispositivo)
    end

    assert_redirected_to dispositivos_url
  end
end
