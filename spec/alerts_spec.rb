describe 'Alerta de javascript', :alerts do
    before(:each)do
    visit 'http://training-wheels-protocol.herokuapp.com/javascript_alerts'
    end

    it 'Alerta' do
        click_button 'Alerta'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 3
    end

    it 'Confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.accept
        expect(page).to have_content 'Mensagem confirmada'
    end

    it ' Não Confirma' do
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'
        page.driver.browser.switch_to.alert.dismiss
        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'Accept Prompt' do
        accept_prompt(with: 'Ruan')do
        click_button 'Prompt'
        sleep 2
    end
        expect(page).to have_content 'Olá, Ruan'
        sleep 3
    end

    it 'dismiss Prompt', :dismiss_prompt do
        dismiss_prompt(with: '') do
            click_button 'Prompt'
            expect(page).to have_content 'Olá, null'
            sleep 3
        end
    end
end