describe "Tabelas", :tabs do
  before(:each) do
    visit "/tables"
  end

  it "Deve exibir o salário do Downey" do
    atores = all("table tbody tr")
    stark = atores.detect { |ator| ator.text.include?("Robert Downey Jr") }
    puts stark.text
    expect(stark.text).to include "10.000.000"
  end

  it "Deve exibir o salário do Vin Diesel" do
    diesel = find("table tbody tr", text: "@vindiesel")
    expect(diesel).to have_content "10.000.000"
  end

  it "Deve exibir o filme velozes" do
    diesel = find("table tbody tr", text: "@vindiesel")
    movie = diesel.all("td")[2].text
    expect(movie).to eql "Velozes e Furiosos"
  end

  it "Deve exibir do insta do Chris Evans" do
    evans = find("table tbody tr", text: "Chris Evans")
    insta = evans.all("td")[4].text
    expect(insta).to eql "@teamcevans"
  end

  it "Deve selecionar Chris Prat para remocao" do
    prat = find("table tbody tr", text: "Chris Pratt")
    prat.find("a", text: "delete").click

    page.driver.browser.switch_to.alert.accept
    expect(msg).to eql "Chris Pratt foi selecionado para remoção!"
  end

  it "Deve selecionar Chris Prat para Edicao" do
    prat = find("table tbody tr", text: "Chris Pratt")
    prat.find("a", text: "edit").click

    page.driver.browser.switch_to.alert.accept
    expect(msg).to eql "Chris Pratt foi selecionado para edição!"
  end
end
