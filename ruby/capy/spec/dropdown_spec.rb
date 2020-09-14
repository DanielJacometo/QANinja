describe 'Caixa de opções', :dropdown do
    
    it 'Item específico simples' do
        visit '/dropdown'
        select('Loki', from: 'dropdown')
        sleep 5
    end

    it 'Item específico com find' do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.find('option', text: 'Scott Lang').select_option
        sleep 5
    end

    it 'qualquer item', :sample do
        visit '/dropdown'
        drop = find('.avenger-list')
        drop.all('option').sample.select_option
        sleep 3
    end
end
