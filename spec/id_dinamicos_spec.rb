describe "IDs dinamicos", :ids_dinamicos do
  before(:each) do
    visit "/access"
  end

  it "cadastro" do
    find("input[id$=UsernameInput]").set "Ruan"
    find("input[id^=PasswordInput]").set "123465"
    find("a[id*=GetStartedButton]").click

    expect(page).to have_content "Dados enviados. Aguarde aprovação do seu cadastro!"
  end
end
# o ícone de $= significa que o ID termina com a palavra
# o ícone de ^= sinifica que o id começa com a palvra
# o ícone de *= sifnifica que o id contem a palavra
