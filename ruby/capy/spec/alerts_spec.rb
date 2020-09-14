describe 'Alertas de JavaScript', :alerts do
    before(:each) do
        visit '/javascript_alerts'
    end

    it 'Alerta' do
        
        click_button 'Alerta'

        msg = page.driver.browser.switch_to.alert.text

        expect(msg).to eql 'Isto é uma mensagem de alerta'
        sleep 1
    end

    it 'sim confirma' do
    
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.accept

        expect(page).to have_content 'Mensagem confirmada'
    end

    it 'não confirma' do
    
        click_button 'Confirma'
        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'E ai confirma?'

        page.driver.browser.switch_to.alert.dismiss

        expect(page).to have_content 'Mensagem não confirmada'
    end

    it 'accept prompt', :accept_prompt do
        
        accept_prompt(with: 'Daniel') do
            click_button 'Prompt'
            sleep 2
        end
        
        expect(page).to have_content 'Olá, Daniel'
        sleep 2
    end

    it 'dismiss prompt', :dismiss_prompt do

        dismiss_prompt() do
            click_button 'Prompt'
        end
        expect(page).to have_content 'Olá, null'        
    end
end