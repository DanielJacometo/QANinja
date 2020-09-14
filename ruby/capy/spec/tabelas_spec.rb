describe 'tabelas', :tabelas, :smoke do
    before(:each) do
        visit '/tables'
    end

    it 'deve exibir o salário do stark' do
        atores = all('table tbody tr')

        stark = atores.detect {|ator| ator.text.include?('Robert Downey Jr')}
        
        expect(stark.text).to include '$ 10.000.000'
    end

    it 'deve exibir o salário do Vin Diesel' do
        Diesel = find('table tbody tr', text: '@vindiesel')
        expect(Diesel).to have_content '$ 10.000.000'
    end

    it 'deve exibir o filme Velozes' do
        Diesel = find('table tbody tr', text: '@vindiesel')

        movie = Diesel.all('td')[2].text

        expect(movie).to eql 'Fast & Furious'
    end

    it 'deve exibir o insta do Chadwick Boseman' do

        boseman = find('table tbody tr', text: 'Chadwick Boseman')
        insta = boseman.all('td')[4].text

        expect(insta).to eql '@chadwickboseman'
    end

    it 'deve selecionar Chris Pratt para remoção' do
        pratt = find('table tbody tr', text: 'Chris Pratt')
        pratt.find('a', text: 'delete').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para remoção!'
    end

    it 'deve selecionar Chris Pratt para remoção' do
        pratt = find('table tbody tr', text: 'Chris Pratt')
        pratt.find('a', text: 'edit').click

        msg = page.driver.browser.switch_to.alert.text
        expect(msg).to eql 'Chris Pratt foi selecionado para edição!'
    end
end 