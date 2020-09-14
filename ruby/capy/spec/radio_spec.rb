describe 'Radio buttons', :radio do

    before(:each) do
        visit '/radios'
    end

    it 'seleção por ID' do
        choose('cap')
    end

    it 'seleção por find e CSS selector' do
        find('input[value=black-panther').click
    end

    after(:each) do
        sleep 3
    end
end
