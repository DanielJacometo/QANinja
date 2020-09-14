describe 'Mouse Hover', :hovers, :smoke do
    before(:each) do
        visit '/hovers'    
    end

    it 'quando passo o mouse sobre o Blade' do
        card = find('img[alt=Blade]')
        card.hover

        expect(page).to have_content 'Nome: Blade'
    end

    it 'quando passo o mouse sobre o Pantera Negra' do
        card = find('img[alt="Pantera Negra"]') #aspas duplas dentro pois tem um espaço/caractere especial, valor deve ser passado como string
        card.hover

        expect(page).to have_content 'Nome: Pantera Negra'
    end

    it 'quando passo o mouse sobre o Homem Aranha' do 
        card = find('img[alt="Homem Aranha"]') 
        #card = find('img[alt$=Aranha]') - $ = TERMINA COM
        #card = find('img[alt^=Homem]') - ^ = COMEÇA COM
        #card = find('img[alt*=Aranha]') - * = CONTÉM
        card.hover

        expect(page).to have_content 'Nome: Homem Aranha'
    end

    after(:each) do
        sleep 0.5
    end
end