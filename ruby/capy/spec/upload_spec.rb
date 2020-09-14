describe 'Upload', :upload do

    before(:each) do
        visit '/upload'
        @arquivo = Dir.pwd + '/spec/fixtures/arquivo.txt'
        @imagem = Dir.pwd + '/spec/fixtures/V.jpg'
    end

    it 'Upload com arquivo texto' do
        attach_file('file-upload', @arquivo)
        click_button 'Upload'

        div_arquivo = find('#uploaded-file')
        expect(div_arquivo.text).to eql 'arquivo.txt'
    end

    it 'upload de imagem', :upload_imagem do
        attach_file('file-upload', @imagem)
        click_button 'Upload'

        #sleep 5
        div_imagem = find('#new-image')
        expect(div_imagem[:src]).to include '/uploads/V.jpg'
    end

    after(:each) do
        sleep 3
    end
end